$OUpath = 'OU=Users,OU=MKC,OU=Steelmet Adm,OU=Vionet,DC=corp,DC=vionet,DC=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute6,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName
$users
$users | Export-Csv -path c:\Users\t0_distathopoulos\Desktop\tepro.csv -Encoding UTF8