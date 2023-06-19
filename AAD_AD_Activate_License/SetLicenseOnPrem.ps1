Import-Module AzureADPreview
connect-AzureAD

$users = Get-AzureADUser -All $true
#$users = Get-AzureADUser -Top 50
$usersToActivate = @()

foreach ($user in $users) {
    $jsonUser=$user.ToJson(); 
    $userAttrs=$jsonUser | ConvertFrom-Json
    $upn=$userAttrs.userPrincipalName
    $company=$userAttrs.companyName
    $extensionAttribute14=$userAttrs.extension_dc52fe1be18341b8adf87f26e4154519_extensionAttribute14
    $extensionAttribute15=$userAttrs.extension_dc52fe1be18341b8adf87f26e4154519_extensionAttribute15

    if ($extensionAttribute15 -eq "physical") {   
        if ($company -ne "") {
            if ($null -eq $extensionAttribute14) {
                $usersToActivate += $upn
            }
        }
    }
}



foreach ($usr in $usersToActivate) {
    $ind = $usr.IndexOf('@');
    $uname = $usr.SubString(0,$ind);
    $uname
    $user = Get-ADUser -Identity $uname -Properties extensionAttribute14,Company;
    
    if ($user.Company -ne "ELVAL") {
        $uname >> users_tolicense.txt
        #Set-ADUser –Identity $uname -update @{"extensionattribute14"="owp"};
        #Set-ADUser –Identity $user -add @{"extensionattribute14"="owp"};
    }
}