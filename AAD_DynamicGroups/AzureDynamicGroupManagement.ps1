<#
	.SYNOPSIS
        Manages Dynamic Group in Azure Active Directory based on certain user attributes.
	The script is intented to be used with Azure Automation. 

        .DESCRIPTION
        The script is using CompanyName attribute & "All Users of " constant to 
	create or delete dynamic Azure Active Directory groups. 
	The script is using CompanyName attribute, Department Attribute to 
	create or delete dynamic Azure Active Directory groups. 
                
        .PARAMETER Name
        Specifies the file name.

        .PARAMETER Extension
        Specifies the extension. "Txt" is the default.

        .INPUTS
        None. You cannot pipe objects. 

        .OUTPUTS
        None. You cannot pipe objects. 

        .EXAMPLE
        C:\PS> extension -name "File"
        File.txt

        .EXAMPLE
        C:\PS> extension -name "File" -extension "doc"
        File.doc

        .EXAMPLE
        C:\PS> extension "File" "doc"
        File.doc

        .LINK        Online version: http://www.fabrikam.com/extension.html

        .LINK
	Get-AzureADUser
        New-AzureADMSGroup

#>

$start = [datetime]::Now

$allCompanies = @()
$allDepartments = @()
$allCompaniesDynGroups = @()
$allCompaniesDynGroupsCompanyNames = @()
$allAutopilotCompaniesDynGroups = @()
$allAutopilotCompaniesDynGroupsCompanyNames = @()

$allCompanyGroup = "All Users of "
$allAutopilotDevicesCompany = "All Autopilot Devices of "
$allAutopilotDevices = "All Autopilot Devices"

# TESTING CODE
<#
$allCompanies += "HALCOR"
$allCompanies += "STEELMET"
$allCompanies += "ANAMET"
$allCompanies += "ALURAME"
$allDepartments += "Administration Dpt"
$allDepartments += "Information Technology Dpt"
#>

//#<#
$allAadUsers = Get-AzureADUser -All:$True
foreach ($user in $allAadUsers) { 
	$oid = $user.ObjectId
	$userAttributes = Get-AzureADUser -ObjectId $oid
	$company = $userAttributes.CompanyName;
	$department = $userAttributes.Department;
	$allCompanies += $company;
	$allDepartments += $department
}

$allCompanies = $AllCompanies | select -Unique
$allDepartments = $AllDepartments | select -Unique
#>

foreach ($company in $allCompanies) {
	$allCompanyGroupName = $allCompanyGroup + $company
	$CurrentDynGroups = Get-AzureADMSGroup -All:$True | Where {($_.GroupTypes -eq 'DynamicMembership')} 
	foreach ($DynGroup in $CurrentDynGroups) {
		$DynGroupName = $DynGroup.DisplayName
		if ( $DynGroupName -eq $allCompanyGroupName ) {
			$allCompaniesDynGroups += $DynGroupName
			$allCompaniesDynGroupsCompanyNames += $company
		}
	}
}

$missingCompanyNameSet1 = $allCompanies | Where {$allCompaniesDynGroupsCompanyNames -NotContains $_}
$missingCompanyNameSet2 = $allCompaniesDynGroupsCompanyNames | Where {$allCompanies -NotContains $_}
$missingCompanyNameSet = $missingCompanyNameSet1 + $missingCompanyNameSet2

foreach ($companyName in $missingCompanyNameSet ) {
	$allCompanyGroupName = $allCompanyGroup + $companyName
	$companyMailNick = $companyName
	$companyMailNick = $companyMailNick.trim()
	$companyMailNick = $companyMailNick -replace '\s',''
	New-AzureADMSGroup -DisplayName "$allCompanyGroupName" -Description "Dynamic Group Users - Uses CompanyName Attribute to populate users of $companyName" -MailEnabled $False -MailNickName "$companyMailNick" -SecurityEnabled $True -GroupTypes "DynamicMembership" -MembershipRule "(user.companyName -eq ""$companyName"")" -MembershipRuleProcessingState "On"
}

foreach ($company in $allCompanies) {
	$allAutopilotDevicesCompanyName = $allAutopilotDevicesCompany + $company
	foreach ($DynGroup in $CurrentDynGroups) {
		$DynGroupName = $DynGroup.DisplayName
		if ( $DynGroupName -eq $allAutopilotDevicesCompanyName ) {
			$allAutopilotCompaniesDynGroups += $DynGroupName
			$allAutopilotCompaniesDynGroupsCompanyNames += $company
		}
	}
}

$missingAutopilotCompanyNameSet1 = $allCompanies | Where {$allAutopilotCompaniesDynGroupsCompanyNames -NotContains $_}
$missingAutopilotCompanyNameSet2 = $allAutopilotCompaniesDynGroupsCompanyNames | Where {$allCompanies -NotContains $_}
$missingAutopilotCompanyNameSet = $missingAutopilotCompanyNameSet1 + $missingAutopilotCompanyNameSet2

foreach ($autoPilotCompanyName in $missingAutopilotCompanyNameSet ) {
	$allCompanyGroupName = $allAutopilotDevicesCompany + $autoPilotCompanyName
	$companyMailNick = $autoPilotCompanyName
	$companyMailNick = $companyMailNick.trim()
	$companyMailNick = $companyMailNick -replace '\s',''
	New-AzureADMSGroup -DisplayName "$allCompanyGroupName" -Description "Dynamic Group Devices - Uses ZTDID Device Attribute and OrderID to populate $allCompanyGroupName" -MailEnabled $False -MailNickName "$companyMailNick" -SecurityEnabled $True -GroupTypes "DynamicMembership" -MembershipRule "(device.devicePhysicalIDs -any _ -contains ""[ZTDID]"") and (device.devicePhysicalIDs -any _ -contains ""[OrderID]:$autoPilotCompanyName"")" -MembershipRuleProcessingState "On"
}

# Autopilot all Devices
$dynGroupLength = $CurrentDynGroups.length
$i=0;
:allAutoPilotDevices foreach ($DynGroup in $CurrentDynGroups) {
	$DynGroupName = $DynGroup.DisplayName
	if ( $DynGroupName -eq $allAutopilotDevices) {
		Break :allAutoPilotDevices;
	}
	$i = $i + 1;
	if ( $i -eq $dynGroupLength ) {
		New-AzureADMSGroup -DisplayName $allAutopilotDevices -Description "Dynamic Group Devices- Uses ZTDID Device Attribute to populate $allAutopilotDevices" -MailEnabled $False -MailNickName "AllAutopilotDevices" -SecurityEnabled $True -GroupTypes "DynamicMembership" -MembershipRule "(device.devicePhysicalIDs -any _ -contains ""[ZTDID]"")" -MembershipRuleProcessingState "On" 
	}
}
$i=0;

$stop = [datetime]::Now
$runTime = New-TimeSpan $start $stop
Write-Host "Script Runtime: $runtime"