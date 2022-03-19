$personsToChangeUpn = @()
$OUpath = 'ou=Anamet_Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName
foreach ($user in $users) {  
	$adn=$user.extensionAttribute15; 
	if ($adn -eq "physical") { 
		$personsToChangeUpn += $user 
	} 
}


foreach ($personToChangeUpn in $personsToChangeUpn) {
    if ($personToChangeUpn.extensionAttribute14) {
        if (!($personToChangeUpn.extensionAttribute14 -like "*s*")) {
            $extraLicense = "s"
            $newLicense = $personToChangeUpn.extensionAttribute14+$extraLicense
            $personToChangeUpn.extensionAttribute14;
            $newLicense;
            $personToChangeUpn.samAccountName
            $command = "Set-ADUser –Identity $($personToChangeUpn.sAMAccountName) -Replace  @{""extensionAttribute14""=""$newLicense""};"
            Invoke-Expression $command
        }
    }
}