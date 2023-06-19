$personsToChangeUpn = @()
$OUpath = 'ou=Metal Agencies,ou=Steelmet Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true') -and (UserPrincipalName -like '*corp.vionet.gr')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,sAMAccountName,distinguishedName,UserPrincipalName
foreach ($user in $users) {  
	$adn=$user.extensionAttribute15; 
	if ($adn -eq "physical") { 
		$personsToChangeUpn += $user 
	} 
}

foreach ($personToChangeUpn in $personsToChangeUpn) {
	$personToChangeUpn
	$newUpn = $personToChangeUpn.UserPrincipalName.Replace("corp.vionet.gr","metalign.eu"); 
	Set-ADUser -Identity $personToChangeUpn -UserPrincipalName $newUpn
}