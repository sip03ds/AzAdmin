$personsWithEmployeeNumAndId = @()
$OUpath = 'dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,sAMAccountName,distinguishedName,UserPrincipalName,employeeID,employeeNumber

foreach ($user in $users) {  
	$adn=$user.employeeID; 
    $emp=$user.employeeNumber; 
    if ( ($adn) -or ($emp)) { 
        $personsWithEmployeeNumAndId += $user 
    }
}
$personsWithEmployeeNumAndId