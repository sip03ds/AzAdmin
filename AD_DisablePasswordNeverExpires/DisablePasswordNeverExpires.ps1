<#
$OUPath = 'ou=Steelmet Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$usersWithPasswordNeverExpires = get-aduser -filter * -properties Name, PasswordNeverExpires,extensionAttribute15,samAccountName -SearchBase $OUpath | where {$_.passwordNeverExpires -eq "true" } | where {$_.extensionAttribute15 -eq "physical" }  | Select-Object DistinguishedName,Name,Enabled,samAccountName 


foreach ($user in $usersWithPasswordNeverExpires) {
    Set-ADUser $user.samAccountName -PasswordNeverExpires $false
}
#>


param(
    # Logging
    [Parameter(Position=0)]
    [switch]$logging,
    # Log File Path
    [Parameter(Position=1)]
    [string]$logPath
)


$start = [datetime]::Now
$today = $start
$textEncoding = [System.Text.Encoding]::UTF8


# Execution Log File 
$day = $today.Day
$month = $today.Month
$year = $today.Year
$date = "$day-$month-$year"
$ExecutionlogFileName = "$date-DisablePasswordNeverExpires.txt"
$ExecutionLogFile = $logPath, $ExecutionlogFileName -join "\"

Add-Content $ExecutionLogFile "  "

# Load AD Module
try{
    Import-Module ActiveDirectory -ErrorAction Stop
}
catch{
    Add-Content $ExecutionLogFile "Unable to load Active Directory PowerShell Module"
}

# Logging Values
if($logging)
{
    if(($logPath) -eq $null)
    {
        $logPath = $PSScriptRoot
    }
}









function getRecursiveGroupMembers {
    Param([String]$GroupDistinguishedName = 'CN=CHROME,OU=Application Groups,OU=Groups,OU=Company1,DC=DEF,DC=AnotherDomain,DC=jkl,DC=AU',
    [Object[]]$PropertiesToLoad  = @('objectclass', 'member', 'name', 'distinguishedname'))

    $ldapPath = "LDAP://$GroupDistinguishedName"
    $listOfMembers = New-Object 'System.Collections.Generic.List[PSCustomObject]'
    $directorySearcher = GetDirectorySearcher $LdapPath $propertiesToLoad
    $result = $directorySearcher.FindOne()

    $members = $result.Properties.member | ForEach-Object { $_ }
    CreateListOfMembers $members $PropertiesToLoad $GroupDistinguishedName $listOfMembers

    #Output the custom objects:
    return $listOfMembers
}

function WriteProgress
{
    Param([Parameter(Mandatory = $true)][Int32]$Numerator,
          [Parameter(Mandatory = $true)][Int32]$Denominator,
          [Parameter(Mandatory = $true)][String]$Status)

    $percentComplete = [int](($Numerator/$Denominator)*100)
    if($percentComplete -le 100)
    {
        Write-Progress -Activity $Status -Status "$Numerator/$Denominator -  $percentComplete%" -PercentComplete $percentComplete
    }
    else
    {
        Write-Warning "Cannot call Write-Progress. $percentComplete% is not valid."
    }
}

function GetDirectorySearcher
{
    param([Parameter(Mandatory=$true)][String]$LdapPath,
          [Parameter(Mandatory=$false)][Object[]]$Properties)
    
    $directoryEntry = New-Object 'System.DirectoryServices.DirectoryEntry'    
    $directoryEntry.Path = $LdapPath
    $searcher = New-Object 'System.DirectoryServices.DirectorySearcher'($directoryEntry)
    $searcher.SearchScope = [System.DirectoryServices.SearchScope]::SubTree
    $searcher.SizeLimit = [System.Int32]::MaxValue
    $searcher.PageSize = [System.Int32]::MaxValue

    if($Properties)
    {
        foreach($property in $Properties)
        {
            $searcher.PropertiesToLoad.Add($property) | Out-Null
        }
    }

    return $searcher
}

function GetNestingLevel
{
    param([Parameter(Mandatory=$true)][String]$NestedGroupNames,
          [Parameter(Mandatory=$true)][String]$Delimeter)

    $nestedGroupNamesSplitByDelimeter = $NestedGroupNames.Split($Delimeter, [System.StringSplitOptions]::None)
    $nestedGroupNamesSplitByDelimeterWithNoBlanks = $nestedGroupNamesSplitByDelimeter | Where-Object { $_ }
    $levelOfNesting = $nestedGroupNamesSplitByDelimeterWithNoBlanks.Count - 1

    return $levelOfNesting
}

function GetNameFromSid
{
    param([Parameter(Mandatory=$true)][String]$Sid)

    $objSid = New-Object 'System.Security.Principal.SecurityIdentifier'($Sid)
    $objUser = $objSid.Translate([System.Security.Principal.NTAccount])
    return $objUser.Value
}

function RemoveDomainNameFromStartOfName
{
    param([Parameter(Mandatory=$true)][String]$Name)

    $indexOfSlash = $Name.IndexOf('\')
    $startIndex = $indexOfSlash + 1 
    $length = $Name.Length - $startIndex
    $nameWithDomainNameRemoved = $Name.Substring($startIndex, $length)
    return $nameWithDomainNameRemoved
}

function GetObjectClass
{
    param([Parameter(Mandatory=$false)][System.DirectoryServices.ResultPropertyValueCollection]$ObjectClasses)
    if(!$ObjectClasses)
    {
        return 'AnotherDomain USER'
    }
    $lastElementInArray = $ObjectClasses.Count-1
    $objectClass = $objectClasses[$lastElementInArray]
    return $objectClass
}

function IsMemberFromAnotherDomain
{
    param([Parameter(Mandatory=$false)][System.DirectoryServices.ResultPropertyValueCollection]$ObjectClasses)

    $objectClass = GetObjectClass $memberAdObject.Properties.objectclass
    $isMemberFromAnotherDomain = $objectClass -eq 'foreignSecurityPrincipal'
    return $isMemberFromAnotherDomain
}

function GetAllMembersOfGroup
{
    param([Parameter(Mandatory=$true)][String]$LdapPath)

    $allMembers = New-Object 'System.Collections.Generic.List[String]'

    $pageSize = 1500

    $pageIndex = 0
    $startIndex = 0
    $endIndex = 0

    $shouldExitLoop = $false

    while(!$shouldExitLoop)
    {                
        $startIndex = $pageIndex * $pageSize
        $endIndex = (($pageIndex + 1) * $pageSize) - 1                
        $propertyName = GetMemberRangePropertyName $startIndex $endIndex
        $pageIndex++

        $propertiesToLoad = @($propertyName)
        $tempDirSearcher = GetDirectorySearcher $LdapPath $propertiesToLoad
        $result = $null
        $adObjectsMembers = $null
        try
        {
            $result = $tempDirSearcher.FindOne()
        }
        catch
        {
            $errorMessage = $_.Exception.Message            
            Write-Warning "Failed search - $errorMessage"
        }   
        $adObjectsMembers = $result.Properties.$propertyName
        if(!$adObjectsMembers)
        {
            $propertyName = GetMemberRangePropertyName $startIndex '*'
            $adObjectsMembers = $result.Properties.$propertyName
            $shouldExitLoop = $true
        }
        AddMembersToList $adObjectsMembers $allMembers        
    }

    return $allMembers
}

function AddMembersToList
{
    param([Parameter(Mandatory=$true)][System.DirectoryServices.ResultPropertyValueCollection]$AdObjectsMembers,
          [Parameter(Mandatory=$false)][System.Collections.Generic.List[String]]$AllMembers)

    foreach($member in $AdObjectsMembers)
    {
        $AllMembers.Add($member)
    }
}

function GetMemberRangePropertyName
{
    param([Parameter(Mandatory=$true)][String]$StartIndex,
          [Parameter(Mandatory=$true)][String]$EndIndex)

    return "member;range=$StartIndex-$EndIndex"
}

function CreateListOfMembers
{
    param([Parameter(Mandatory=$true)][Object[]]$Members,
          [Parameter(Mandatory=$true)][Object[]]$PropertiesToLoad,
          [Parameter(Mandatory=$true)][String]$NestedGroupNames,
          [Parameter(Mandatory=$false)][System.Collections.Generic.List[PSCustomObject]]$ListOfMembers)

    $delimeter = '|'

    for($k = 0; $k -lt $members.Count; $k++)
    {
        $distinguishedName = $members[$k]
        WriteProgress ($k+1) $members.Count "Searching for $distinguishedName"
        $memberLdapPath = "LDAP://$distinguishedName"
        $tempDirSearcher = GetDirectorySearcher $memberLdapPath $PropertiesToLoad
        $memberAdObject = $tempDirSearcher.FindOne()

        if($memberAdObject -and $memberAdObject.Properties.name.Count -gt 0)
        {
            $name = $memberAdObject.Properties.name[0]
            $isMemberFromAnotherDomain = IsMemberFromAnotherDomain $memberAdObject.Properties.objectclass
            if($isMemberFromAnotherDomain)
            {
                $name = GetNameFromSid $name
                $name = RemoveDomainNameFromStartOfName $name
                $distinguishedName = "CN=$name,OU=Applications,DC=AnotherDomain,DC=jkl,DC=AU"
                $memberLdapPath = "LDAP://$distinguishedName"
                $tempDirSearcher = GetDirectorySearcher $memberLdapPath $PropertiesToLoad
                $memberAdObject = $null
                try
                {
                    $memberAdObject = $tempDirSearcher.FindOne()
                }
                catch
                {
                    $errorMsg = $_.Exception.Message
                    Write-Warning "Tried searching for a group called $name. It's probably a AnotherDomain user and not a group - $errorMsg"
                }
            }

            $objectClass = GetObjectClass $memberAdObject.Properties.objectclass
            $isMemberOfTypeGroup = $objectClass.ToUpper() -eq 'GROUP'

            if($isMemberOfTypeGroup)
            {
                #This prevents an infinite loop in case a parent group is a member of a child group:
                if($NestedGroupNames.Contains($distinguishedName)) 
                {
                    continue
                }
                $newNestedGroupNames = "$distinguishedName$delimeter$NestedGroupNames"
                $areThereBetween1and1500Members = $memberAdObject.Properties.member -and $memberAdObject.Properties.member.Count -gt 0
                $areThereMoreThan1500Members = $memberAdObject.Properties.'member;range=0-1499' -and $memberAdObject.Properties.'member;range=0-1499'.Count -gt 0
                if($areThereBetween1and1500Members -or $areThereMoreThan1500Members)
                {
                    $currentAdObjectsMembers = ''
                    if($areThereBetween1and1500Members)
                    {
                        $currentAdObjectsMembers = $memberAdObject.Properties.member | ForEach-Object { $_ }
                    }
                    elseif($areThereMoreThan1500Members)
                    {
                        $currentAdObjectsMembers = GetAllMembersOfGroup $memberAdObject.Path
                    }
                    CreateListOfMembers $currentAdObjectsMembers $PropertiesToLoad $newNestedGroupNames $ListOfMembers
                }
            }
            else
            {            
                $levelOfNesting = GetNestingLevel $NestedGroupNames $delimeter
                $customObject = [PSCustomObject]@{Name = $name; LevelOfNesting = $LevelOfNesting; NestedGroupNames = $NestedGroupNames; ObjectClass = $objectClass}
                $ListOfMembers.Add($customObject)
            }
        }
    }
}



















# Set Output Formatting - Padding characters
$padVal = "20"
Add-Content $ExecutionLogFile "Script Loaded"
Add-Content $ExecutionLogFile "*** Starting Summary ***"
Add-Content $ExecutionLogFile " Getting all AD User Groups where every FGGP applies "
$userGroupsWherePasswordPoliciesApply = Get-ADFineGrainedPasswordPolicy -Filter * | Select-Object Select-Object -ExpandProperty AppliesTo;

foreach ($userGroup in $userGroupsWherePasswordPoliciesApply) {
    Add-Content $ExecutionLogFile " Analyzing AD Group $userGroup "
    Add-Content $ExecutionLogFile " ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "
    $users;
    try { 
        $users = getRecursiveGroupMembers($userGroup);
    } catch { 
        $errorMessage = $_.exception.Message
        Add-Content $ExecutionLogFile " PROBLEMA !!!"
        Add-Content $ExecutionLogFile "  $errorMessage"
    }
    Add-Content $ExecutionLogFile " TSIMPISAME TOYS AXRHSTOYS !!!!"
    foreach ($user in $users) {
        $usr=$user.Name;
        Add-Content $ExecutionLogFile " Getting User ""$usr"" "
        $userData = Get-AdUser -Filter "name -eq ""$usr""" -Properties Name,PasswordNeverExpires,samAccountName;
        Add-Content $ExecutionLogFile " Got user data!!! "
        if ($userData.PasswordNeverExpires) {
            Add-Content $ExecutionLogFile " Password is set to expiry! "
            Get-ADUser -Filter "name -eq ""$usr""" | Set-ADUser -PasswordNeverExpires:$False
            Add-Content $ExecutionLogFile " Not anymore... "
        }
    }
    
    <#

    $group = Get-ADGroup -Identity $userGroup
    Add-Content $ExecutionLogFile " $group"
    Add-Content $ExecutionLogFile " Getting AD Users on $userGroup "
    try {
        $users = Get-ADGroupMember -Identity $group
	    Add-Content $ExecutionLogFile " Analyzing Users "
        foreach ($user in $users) {
            $userPasswordConfig = Get-ADUser -Identity $user.samAccountName -properties Name,PasswordNeverExpires,samAccountName;
            if ($userPasswordConfig.PasswordNeverExpires) {
                Write-Output $userPasswordConfig.samAccountName
                Get-ADUser -Identity $user | Set-ADUser -PasswordNeverExpires:$False
            }
        }
    }
    catch{
        $errorMessage = $_.exception.Message
        Add-Content $ExecutionLogFile " Problem with AD Group "
        Add-Content $ExecutionLogFile "  $errorMessage"
    }
    #>
    Add-Content $ExecutionLogFile " ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "
}

$stop = [datetime]::Now
$runTime = New-TimeSpan $start $stop
Add-Content $ExecutionLogFile "Script Runtime: $runtime"
