$steelmetOUPhysicalPersons = @()
$OUpath = 'ou=Steelmet Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true') " -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,sAMAccountName,distinguishedName,UserPrincipalName
foreach ($user in $users) { $adn=$user.extensionAttribute15; if ($adn -eq "physical") { $steelmetOUPhysicalPersons += $user } }

