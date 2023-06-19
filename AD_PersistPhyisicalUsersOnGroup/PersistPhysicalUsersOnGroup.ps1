# ELVAL OFFICE USERS
<#
$OUpath = 'ou=Elval,ou=Office,ou=Elval Adm,ou=Vionet,dc=corp,dc=vionet,dc=gr'
$groupName = 'BASELINE Elval Office Physical Users'

$users = Get-ADUser -Filter 'enabled -eq "true"' -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,extensionAttribute15
$members = Get-ADGroupMember -Identity $groupName -Recursive | Select -ExpandProperty SamAccountName
$physicalUsers = @()
$physicalUsersToAdd = @()

#foreach ($user in $users) { 
	$ex=$user.extensionAttribute15;
	if ( $ex -eq "physical" )
    {
		$physicalUsers += $user
    } 
}

foreach ($user in $physicalUsers ) {
    If (!($members -contains $user)) {
        $physicalUsersToAdd += $user
	}
}

Add-AdGroupMember -Identity $groupName $physicalUsersToAdd 
#Get-ADGroupMember $groupName  | ForEach-Object {Remove-ADGroupMember $groupName  $_ -Confirm:$false}
#>
# ALURAME
$OUpath = 'ou=Alurame,ou=Steelmet Adm,ou=Vionet,dc=corp,dc=vionet,dc=gr'
$groupName = 'BASELINE Alurame Physical Users'

$users = Get-ADUser -Filter 'enabled -eq "true"' -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,extensionAttribute15
$members = Get-ADGroupMember -Identity $groupName -Recursive | Select -ExpandProperty SamAccountName
$physicalUsers = @()
$physicalUsersToAdd = @()

foreach ($user in $users) { 
	$ex=$user.extensionAttribute15;
	if ( $ex -eq "physical" )
    {
		$physicalUsers += $user
    } 
}

foreach ($user in $physicalUsers ) {
    If (!($members -contains $user)) {
        $physicalUsersToAdd += $user
	}
}
Add-AdGroupMember -Identity $groupName $physicalUsersToAdd 
#Get-ADGroupMember $groupName  | ForEach-Object {Remove-ADGroupMember $groupName  $_ -Confirm:$false}

# ATTIKI
$OUpath = 'ou=Attiki,ou=Steelmet Adm,ou=Vionet,dc=corp,dc=vionet,dc=gr'
$groupName = 'BASELINE Attiki Physical Users'

$users = Get-ADUser -Filter 'enabled -eq "true"' -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,extensionAttribute15
$members = Get-ADGroupMember -Identity $groupName -Recursive | Select -ExpandProperty SamAccountName
$physicalUsers = @()
$physicalUsersToAdd = @()

foreach ($user in $users) { 
	$ex=$user.extensionAttribute15;
	if ( $ex -eq "physical" )
    {
		$physicalUsers += $user
    } 
}

foreach ($user in $physicalUsers ) {
    If (!($members -contains $user)) {
        $physicalUsersToAdd += $user
	}
}
Add-AdGroupMember -Identity $groupName $physicalUsersToAdd 
#Get-ADGroupMember $groupName  | ForEach-Object {Remove-ADGroupMember $groupName  $_ -Confirm:$false}

# BASE METAL
$OUpath = 'ou=Base Metal,ou=Steelmet Adm,ou=Vionet,dc=corp,dc=vionet,dc=gr'
$groupName = 'BASELINE Base Metal Physical Users'

$users = Get-ADUser -Filter 'enabled -eq "true"' -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,extensionAttribute15
$members = Get-ADGroupMember -Identity $groupName -Recursive | Select -ExpandProperty SamAccountName
$physicalUsers = @()
$physicalUsersToAdd = @()

foreach ($user in $users) { 
	$ex=$user.extensionAttribute15;
	if ( $ex -eq "physical" )
    {
		$physicalUsers += $user
    } 
}

foreach ($user in $physicalUsers ) {
    If (!($members -contains $user)) {
        $physicalUsersToAdd += $user
	}
}
Add-AdGroupMember -Identity $groupName $physicalUsersToAdd 
#Get-ADGroupMember $groupName  | ForEach-Object {Remove-ADGroupMember $groupName  $_ -Confirm:$false}

# CENERGY HOLDINGS
$OUpath = 'ou=Cenergy Holdings,ou=Steelmet Adm,ou=Vionet,dc=corp,dc=vionet,dc=gr'
$groupName = 'BASELINE Cenergy Holdings Physical Users'

$users = Get-ADUser -Filter 'enabled -eq "true"' -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,extensionAttribute15
$members = Get-ADGroupMember -Identity $groupName -Recursive | Select -ExpandProperty SamAccountName
$physicalUsers = @()
$physicalUsersToAdd = @()

foreach ($user in $users) { 
	$ex=$user.extensionAttribute15;
	if ( $ex -eq "physical" )
    {
		$physicalUsers += $user
    } 
}

foreach ($user in $physicalUsers ) {
    If (!($members -contains $user)) {
        $physicalUsersToAdd += $user
	}
}
Add-AdGroupMember -Identity $groupName $physicalUsersToAdd 
#Get-ADGroupMember $groupName  | ForEach-Object {Remove-ADGroupMember $groupName  $_ -Confirm:$false}

# CHOES
$OUpath = 'ou=CHOES,ou=Steelmet Adm,ou=Vionet,dc=corp,dc=vionet,dc=gr'
$groupName = 'BASELINE Choes Physical Users'

$users = Get-ADUser -Filter 'enabled -eq "true"' -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,extensionAttribute15
$members = Get-ADGroupMember -Identity $groupName -Recursive | Select -ExpandProperty SamAccountName
$physicalUsers = @()
$physicalUsersToAdd = @()

foreach ($user in $users) { 
	$ex=$user.extensionAttribute15;
	if ( $ex -eq "physical" )
    {
		$physicalUsers += $user
    } 
}

foreach ($user in $physicalUsers ) {
    If (!($members -contains $user)) {
        $physicalUsersToAdd += $user
	}
}
Add-AdGroupMember -Identity $groupName $physicalUsersToAdd 
#Get-ADGroupMember $groupName  | ForEach-Object {Remove-ADGroupMember $groupName  $_ -Confirm:$false}

# EIAX
$OUpath = 'ou=Eiax,ou=Steelmet Adm,ou=Vionet,dc=corp,dc=vionet,dc=gr'
$groupName = 'BASELINE Eiax Physical Users'

$users = Get-ADUser -Filter 'enabled -eq "true"' -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,extensionAttribute15
$members = Get-ADGroupMember -Identity $groupName -Recursive | Select -ExpandProperty SamAccountName
$physicalUsers = @()
$physicalUsersToAdd = @()

foreach ($user in $users) { 
	$ex=$user.extensionAttribute15;
	if ( $ex -eq "physical" )
    {
		$physicalUsers += $user
    } 
}

foreach ($user in $physicalUsers ) {
    If (!($members -contains $user)) {
        $physicalUsersToAdd += $user
	}
}
Add-AdGroupMember -Identity $groupName $physicalUsersToAdd 
#Get-ADGroupMember $groupName  | ForEach-Object {Remove-ADGroupMember $groupName  $_ -Confirm:$false}


# ELVAL AUTOMOTIVE
$OUpath = 'ou=Elval Automotive,ou=Steelmet Adm,ou=Vionet,dc=corp,dc=vionet,dc=gr'
$groupName = 'BASELINE Elval Automotive Physical Users'

$users = Get-ADUser -Filter 'enabled -eq "true"' -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,extensionAttribute15
$members = Get-ADGroupMember -Identity $groupName -Recursive | Select -ExpandProperty SamAccountName
$physicalUsers = @()
$physicalUsersToAdd = @()

foreach ($user in $users) { 
	$ex=$user.extensionAttribute15;
	if ( $ex -eq "physical" )
    {
		$physicalUsers += $user
    } 
}

foreach ($user in $physicalUsers ) {
    If (!($members -contains $user)) {
        $physicalUsersToAdd += $user
	}
}
Add-AdGroupMember -Identity $groupName $physicalUsersToAdd 
#Get-ADGroupMember $groupName  | ForEach-Object {Remove-ADGroupMember $groupName  $_ -Confirm:$false}

# ERGOSTEEL
$OUpath = 'ou=ErgoSteel,ou=Steelmet Adm,ou=Vionet,dc=corp,dc=vionet,dc=gr'
$groupName = 'BASELINE ErgoSteel Physical Users'

$users = Get-ADUser -Filter 'enabled -eq "true"' -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,extensionAttribute15
$members = Get-ADGroupMember -Identity $groupName -Recursive | Select -ExpandProperty SamAccountName
$physicalUsers = @()
$physicalUsersToAdd = @()

foreach ($user in $users) { 
	$ex=$user.extensionAttribute15;
	if ( $ex -eq "physical" )
    {
		$physicalUsers += $user
    } 
}

foreach ($user in $physicalUsers ) {
    If (!($members -contains $user)) {
        $physicalUsersToAdd += $user
	}
}

Add-AdGroupMember -Identity $groupName $physicalUsersToAdd 
#Get-ADGroupMember $groupName  | ForEach-Object {Remove-ADGroupMember $groupName  $_ -Confirm:$false}

# FOMENTOS
$OUpath = 'ou=Fomentos,ou=Steelmet Adm,ou=Vionet,dc=corp,dc=vionet,dc=gr'
$groupName = 'BASELINE Fomentos Physical Users'

$users = Get-ADUser -Filter 'enabled -eq "true"' -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,extensionAttribute15
$members = Get-ADGroupMember -Identity $groupName -Recursive | Select -ExpandProperty SamAccountName
$physicalUsers = @()
$physicalUsersToAdd = @()

foreach ($user in $users) { 
	$ex=$user.extensionAttribute15;
	if ( $ex -eq "physical" )
    {
		$physicalUsers += $user
    } 
}

foreach ($user in $physicalUsers ) {
    If (!($members -contains $user)) {
        $physicalUsersToAdd += $user
	}
}
Add-AdGroupMember -Identity $groupName $physicalUsersToAdd 
#Get-ADGroupMember $groupName  | ForEach-Object {Remove-ADGroupMember $groupName  $_ -Confirm:$false}

# GENECOS
$OUpath = 'ou=Genecos,ou=Steelmet Adm,ou=Vionet,dc=corp,dc=vionet,dc=gr'
$groupName = 'BASELINE Genecos Physical Users'

$users = Get-ADUser -Filter 'enabled -eq "true"' -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,extensionAttribute15
$members = Get-ADGroupMember -Identity $groupName -Recursive | Select -ExpandProperty SamAccountName
$physicalUsers = @()
$physicalUsersToAdd = @()

foreach ($user in $users) { 
	$ex=$user.extensionAttribute15;
	if ( $ex -eq "physical" )
    {
		$physicalUsers += $user
    } 
}

foreach ($user in $physicalUsers ) {
    If (!($members -contains $user)) {
        $physicalUsersToAdd += $user
	}
}
Add-AdGroupMember -Identity $groupName $physicalUsersToAdd 
#Get-ADGroupMember $groupName  | ForEach-Object {Remove-ADGroupMember $groupName  $_ -Confirm:$false}

# HELLENIC PRODUCTION
$OUpath = 'ou=Hellenic Production,ou=Steelmet Adm,ou=Vionet,dc=corp,dc=vionet,dc=gr'
$groupName = 'BASELINE Hellenic Production Physical Users'

$users = Get-ADUser -Filter 'enabled -eq "true"' -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,extensionAttribute15
$members = Get-ADGroupMember -Identity $groupName -Recursive | Select -ExpandProperty SamAccountName
$physicalUsers = @()
$physicalUsersToAdd = @()

foreach ($user in $users) { 
	$ex=$user.extensionAttribute15;
	if ( $ex -eq "physical" )
    {
		$physicalUsers += $user
    } 
}

foreach ($user in $physicalUsers ) {
    If (!($members -contains $user)) {
        $physicalUsersToAdd += $user
	}
}
Add-AdGroupMember -Identity $groupName $physicalUsersToAdd 
#Get-ADGroupMember $groupName  | ForEach-Object {Remove-ADGroupMember $groupName  $_ -Confirm:$false}

# INTERNATIONAL TRADE
$OUpath = 'ou=International Trade,ou=Steelmet Adm,ou=Vionet,dc=corp,dc=vionet,dc=gr'
$groupName = 'BASELINE International Trade Physical Users'

$users = Get-ADUser -Filter 'enabled -eq "true"' -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,extensionAttribute15
$members = Get-ADGroupMember -Identity $groupName -Recursive | Select -ExpandProperty SamAccountName
$physicalUsers = @()
$physicalUsersToAdd = @()

foreach ($user in $users) { 
	$ex=$user.extensionAttribute15;
	if ( $ex -eq "physical" )
    {
		$physicalUsers += $user
    } 
}

foreach ($user in $physicalUsers ) {
    If (!($members -contains $user)) {
        $physicalUsersToAdd += $user
	}
}
Add-AdGroupMember -Identity $groupName $physicalUsersToAdd 
#Get-ADGroupMember $groupName  | ForEach-Object {Remove-ADGroupMember $groupName  $_ -Confirm:$false}

# Mare West
$OUpath = 'ou=Mare West,ou=Steelmet Adm,ou=Vionet,dc=corp,dc=vionet,dc=gr'
$groupName = 'BASELINE Mare West Physical Users'

$users = Get-ADUser -Filter 'enabled -eq "true"' -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,extensionAttribute15
$members = Get-ADGroupMember -Identity $groupName -Recursive | Select -ExpandProperty SamAccountName
$physicalUsers = @()
$physicalUsersToAdd = @()

foreach ($user in $users) { 
	$ex=$user.extensionAttribute15;
	if ( $ex -eq "physical" )
    {
		$physicalUsers += $user
    } 
}

foreach ($user in $physicalUsers ) {
    If (!($members -contains $user)) {
        $physicalUsersToAdd += $user
	}
}
Add-AdGroupMember -Identity $groupName $physicalUsersToAdd 
#Get-ADGroupMember $groupName  | ForEach-Object {Remove-ADGroupMember $groupName  $_ -Confirm:$false}

# Metal Agencies
$OUpath = 'ou=Metal Agencies,ou=Steelmet Adm,ou=Vionet,dc=corp,dc=vionet,dc=gr'
$groupName = 'BASELINE Metal Agencies Physical Users'

$users = Get-ADUser -Filter 'enabled -eq "true"' -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,extensionAttribute15
$members = Get-ADGroupMember -Identity $groupName -Recursive | Select -ExpandProperty SamAccountName
$physicalUsers = @()
$physicalUsersToAdd = @()

foreach ($user in $users) { 
	$ex=$user.extensionAttribute15;
	if ( $ex -eq "physical" )
    {
		$physicalUsers += $user
    } 
}

foreach ($user in $physicalUsers ) {
    If (!($members -contains $user)) {
        $physicalUsersToAdd += $user
	}
}
Add-AdGroupMember -Identity $groupName $physicalUsersToAdd 
#Get-ADGroupMember $groupName  | ForEach-Object {Remove-ADGroupMember $groupName  $_ -Confirm:$false}

# Metalign Gr
$OUpath = 'ou=Metalign Gr,ou=Steelmet Adm,ou=Vionet,dc=corp,dc=vionet,dc=gr'
$groupName = 'BASELINE Metalign Gr Physical Users'

$users = Get-ADUser -Filter 'enabled -eq "true"' -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,extensionAttribute15
$members = Get-ADGroupMember -Identity $groupName -Recursive | Select -ExpandProperty SamAccountName
$physicalUsers = @()
$physicalUsersToAdd = @()

foreach ($user in $users) { 
	$ex=$user.extensionAttribute15;
	if ( $ex -eq "physical" )
    {
		$physicalUsers += $user
    } 
}

foreach ($user in $physicalUsers ) {
    If (!($members -contains $user)) {
        $physicalUsersToAdd += $user
	}
}
Add-AdGroupMember -Identity $groupName $physicalUsersToAdd 
#Get-ADGroupMember $groupName  | ForEach-Object {Remove-ADGroupMember $groupName  $_ -Confirm:$false}

# MKC
$OUpath = 'ou=MKC,ou=Steelmet Adm,ou=Vionet,dc=corp,dc=vionet,dc=gr'
$groupName = 'BASELINE MKC Physical Users'

$users = Get-ADUser -Filter 'enabled -eq "true"' -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,extensionAttribute15
$members = Get-ADGroupMember -Identity $groupName -Recursive | Select -ExpandProperty SamAccountName
$physicalUsers = @()
$physicalUsersToAdd = @()

foreach ($user in $users) { 
	$ex=$user.extensionAttribute15;
	if ( $ex -eq "physical" )
    {
		$physicalUsers += $user
    } 
}

foreach ($user in $physicalUsers ) {
    If (!($members -contains $user)) {
        $physicalUsersToAdd += $user
	}
}
Add-AdGroupMember -Identity $groupName $physicalUsersToAdd 
#Get-ADGroupMember $groupName  | ForEach-Object {Remove-ADGroupMember $groupName  $_ -Confirm:$false}

# Noval
$OUpath = 'ou=Noval,ou=Steelmet Adm,ou=Vionet,dc=corp,dc=vionet,dc=gr'
$groupName = 'BASELINE Noval Physical Users'

$users = Get-ADUser -Filter 'enabled -eq "true"' -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,extensionAttribute15
$members = Get-ADGroupMember -Identity $groupName -Recursive | Select -ExpandProperty SamAccountName
$physicalUsers = @()
$physicalUsersToAdd = @()

foreach ($user in $users) { 
	$ex=$user.extensionAttribute15;
	if ( $ex -eq "physical" )
    {
		$physicalUsers += $user
    } 
}

foreach ($user in $physicalUsers ) {
    If (!($members -contains $user)) {
        $physicalUsersToAdd += $user
	}
}
Add-AdGroupMember -Identity $groupName $physicalUsersToAdd 
#Get-ADGroupMember $groupName  | ForEach-Object {Remove-ADGroupMember $groupName  $_ -Confirm:$false}

# Reynolds
$OUpath = 'ou=Reynolds,ou=Steelmet Adm,ou=Vionet,dc=corp,dc=vionet,dc=gr'
$groupName = 'BASELINE Reynolds Physical Users'

$users = Get-ADUser -Filter 'enabled -eq "true"' -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,extensionAttribute15
$members = Get-ADGroupMember -Identity $groupName -Recursive | Select -ExpandProperty SamAccountName
$physicalUsers = @()
$physicalUsersToAdd = @()

foreach ($user in $users) { 
	$ex=$user.extensionAttribute15;
	if ( $ex -eq "physical" )
    {
		$physicalUsers += $user
    } 
}

foreach ($user in $physicalUsers ) {
    If (!($members -contains $user)) {
        $physicalUsersToAdd += $user
	}
}
Add-AdGroupMember -Identity $groupName $physicalUsersToAdd 
#Get-ADGroupMember $groupName  | ForEach-Object {Remove-ADGroupMember $groupName  $_ -Confirm:$false}

# River West
$OUpath = 'ou=River West,ou=Steelmet Adm,ou=Vionet,dc=corp,dc=vionet,dc=gr'
$groupName = 'BASELINE River West Physical Users'

$users = Get-ADUser -Filter 'enabled -eq "true"' -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,extensionAttribute15
$members = Get-ADGroupMember -Identity $groupName -Recursive | Select -ExpandProperty SamAccountName
$physicalUsers = @()
$physicalUsersToAdd = @()

foreach ($user in $users) { 
	$ex=$user.extensionAttribute15;
	if ( $ex -eq "physical" )
    {
		$physicalUsers += $user
    } 
}

foreach ($user in $physicalUsers ) {
    If (!($members -contains $user)) {
        $physicalUsersToAdd += $user
	}
}
Add-AdGroupMember -Identity $groupName $physicalUsersToAdd 
#Get-ADGroupMember $groupName  | ForEach-Object {Remove-ADGroupMember $groupName  $_ -Confirm:$false}

# Stassinopoulos-Viohalco Foundation
$OUpath = 'ou=Stassinopoulos-Viohalco Foundation,ou=Steelmet Adm,ou=Vionet,dc=corp,dc=vionet,dc=gr'
$groupName = 'BASELINE Stassinopoulos-Viohalco Foundation Physical Users'

$users = Get-ADUser -Filter 'enabled -eq "true"' -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,extensionAttribute15
$members = Get-ADGroupMember -Identity $groupName -Recursive | Select -ExpandProperty SamAccountName
$physicalUsers = @()
$physicalUsersToAdd = @()

foreach ($user in $users) { 
	$ex=$user.extensionAttribute15;
	if ( $ex -eq "physical" )
    {
		$physicalUsers += $user
    } 
}

foreach ($user in $physicalUsers ) {
    If (!($members -contains $user)) {
        $physicalUsersToAdd += $user
	}
}
Add-AdGroupMember -Identity $groupName $physicalUsersToAdd 
#Get-ADGroupMember $groupName  | ForEach-Object {Remove-ADGroupMember $groupName  $_ -Confirm:$false}

# Steelmet Marousi
$OUpath = 'ou=Steelmet Marousi,ou=Steelmet Adm,ou=Vionet,dc=corp,dc=vionet,dc=gr'
$groupName = 'BASELINE Steelmet Marousi Physical Users'

$users = Get-ADUser -Filter 'enabled -eq "true"' -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,extensionAttribute15
$members = Get-ADGroupMember -Identity $groupName -Recursive | Select -ExpandProperty SamAccountName
$physicalUsers = @()
$physicalUsersToAdd = @()

foreach ($user in $users) { 
	$ex=$user.extensionAttribute15;
	if ( $ex -eq "physical" )
    {
		$physicalUsers += $user
    } 
}

foreach ($user in $physicalUsers ) {
    If (!($members -contains $user)) {
        $physicalUsersToAdd += $user
	}
}
Add-AdGroupMember -Identity $groupName $physicalUsersToAdd 
#Get-ADGroupMember $groupName  | ForEach-Object {Remove-ADGroupMember $groupName  $_ -Confirm:$false}

# Steelmet Property Services
$OUpath = 'ou=Steelmet Property Services,ou=Steelmet Adm,ou=Vionet,dc=corp,dc=vionet,dc=gr'
$groupName = 'BASELINE Steelmet Property Services Physical Users'

$users = Get-ADUser -Filter 'enabled -eq "true"' -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,extensionAttribute15
$members = Get-ADGroupMember -Identity $groupName -Recursive | Select -ExpandProperty SamAccountName
$physicalUsers = @()
$physicalUsersToAdd = @()

foreach ($user in $users) { 
	$ex=$user.extensionAttribute15;
	if ( $ex -eq "physical" )
    {
		$physicalUsers += $user
    } 
}

foreach ($user in $physicalUsers ) {
    If (!($members -contains $user)) {
        $physicalUsersToAdd += $user
	}
}
Add-AdGroupMember -Identity $groupName $physicalUsersToAdd 
#Get-ADGroupMember $groupName  | ForEach-Object {Remove-ADGroupMember $groupName  $_ -Confirm:$false}

# TeproMetal Germany
$OUpath = 'ou=TeproMetal Germany,ou=Steelmet Adm,ou=Vionet,dc=corp,dc=vionet,dc=gr'
$groupName = 'BASELINE TeproMetal Germany Physical Users'

$users = Get-ADUser -Filter 'enabled -eq "true"' -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,extensionAttribute15
$members = Get-ADGroupMember -Identity $groupName -Recursive | Select -ExpandProperty SamAccountName
$physicalUsers = @()
$physicalUsersToAdd = @()

foreach ($user in $users) { 
	$ex=$user.extensionAttribute15;
	if ( $ex -eq "physical" )
    {
		$physicalUsers += $user
    } 
}

foreach ($user in $physicalUsers ) {
    If (!($members -contains $user)) {
        $physicalUsersToAdd += $user
	}
}
Add-AdGroupMember -Identity $groupName $physicalUsersToAdd 
#Get-ADGroupMember $groupName  | ForEach-Object {Remove-ADGroupMember $groupName  $_ -Confirm:$false}

# TeproMetal Sofia
$OUpath = 'ou=TeproMetal Sofia,ou=Steelmet Adm,ou=Vionet,dc=corp,dc=vionet,dc=gr'
$groupName = 'BASELINE TeproMetal Sofia Physical Users'

$users = Get-ADUser -Filter 'enabled -eq "true"' -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,extensionAttribute15
$members = Get-ADGroupMember -Identity $groupName -Recursive | Select -ExpandProperty SamAccountName
$physicalUsers = @()
$physicalUsersToAdd = @()

foreach ($user in $users) { 
	$ex=$user.extensionAttribute15;
	if ( $ex -eq "physical" )
    {
		$physicalUsers += $user
    } 
}

foreach ($user in $physicalUsers ) {
    If (!($members -contains $user)) {
        $physicalUsersToAdd += $user
	}
}
Add-AdGroupMember -Identity $groupName $physicalUsersToAdd 
#Get-ADGroupMember $groupName  | ForEach-Object {Remove-ADGroupMember $groupName  $_ -Confirm:$false}

# Viener
$OUpath = 'ou=Viener,ou=Steelmet Adm,ou=Vionet,dc=corp,dc=vionet,dc=gr'
$groupName = 'BASELINE Viener Physical Users'

$users = Get-ADUser -Filter 'enabled -eq "true"' -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,extensionAttribute15
$members = Get-ADGroupMember -Identity $groupName -Recursive | Select -ExpandProperty SamAccountName
$physicalUsers = @()
$physicalUsersToAdd = @()

foreach ($user in $users) { 
	$ex=$user.extensionAttribute15;
	if ( $ex -eq "physical" )
    {
		$physicalUsers += $user
    } 
}

foreach ($user in $physicalUsers ) {
    If (!($members -contains $user)) {
        $physicalUsersToAdd += $user
	}
}
Add-AdGroupMember -Identity $groupName $physicalUsersToAdd 
#Get-ADGroupMember $groupName  | ForEach-Object {Remove-ADGroupMember $groupName  $_ -Confirm:$false}

# Viohalco S.A.
$OUpath = 'ou=Viohalco S.A.,ou=Steelmet Adm,ou=Vionet,dc=corp,dc=vionet,dc=gr'
$groupName = 'BASELINE Viohalco S.A. Physical Users'

$users = Get-ADUser -Filter 'enabled -eq "true"' -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,extensionAttribute15
$members = Get-ADGroupMember -Identity $groupName -Recursive | Select -ExpandProperty SamAccountName
$physicalUsers = @()
$physicalUsersToAdd = @()

foreach ($user in $users) { 
	$ex=$user.extensionAttribute15;
	if ( $ex -eq "physical" )
    {
		$physicalUsers += $user
    } 
}

foreach ($user in $physicalUsers ) {
    If (!($members -contains $user)) {
        $physicalUsersToAdd += $user
	}
}
Add-AdGroupMember -Identity $groupName $physicalUsersToAdd 
#Get-ADGroupMember $groupName  | ForEach-Object {Remove-ADGroupMember $groupName  $_ -Confirm:$false}

# VIOMAL
$OUpath = 'ou=Viomal,ou=Steelmet Adm,ou=Vionet,dc=corp,dc=vionet,dc=gr'
$groupName = 'BASELINE Viomal Physical Users'

$users = Get-ADUser -Filter 'enabled -eq "true"' -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,extensionAttribute15
$members = Get-ADGroupMember -Identity $groupName -Recursive | Select -ExpandProperty SamAccountName
$physicalUsers = @()
$physicalUsersToAdd = @()

foreach ($user in $users) { 
	$ex=$user.extensionAttribute15;
	if ( $ex -eq "physical" )
    {
		$physicalUsers += $user
    } 
}

foreach ($user in $physicalUsers ) {
    If (!($members -contains $user)) {
        $physicalUsersToAdd += $user
	}
}
Add-AdGroupMember -Identity $groupName $physicalUsersToAdd 
#Get-ADGroupMember $groupName  | ForEach-Object {Remove-ADGroupMember $groupName  $_ -Confirm:$false}

# VITRUVIT
$OUpath = 'ou=Vitruvit,ou=Steelmet Adm,ou=Vionet,dc=corp,dc=vionet,dc=gr'
$groupName = 'BASELINE Vitruvit Physical Users'

$users = Get-ADUser -Filter 'enabled -eq "true"' -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,extensionAttribute15
$members = Get-ADGroupMember -Identity $groupName -Recursive | Select -ExpandProperty SamAccountName
$physicalUsers = @()
$physicalUsersToAdd = @()

foreach ($user in $users) { 
	$ex=$user.extensionAttribute15;
	if ( $ex -eq "physical" )
    {
		$physicalUsers += $user
    } 
}

foreach ($user in $physicalUsers ) {
    If (!($members -contains $user)) {
        $physicalUsersToAdd += $user
	}
}

Add-AdGroupMember -Identity $groupName $physicalUsersToAdd 
#Get-ADGroupMember $groupName  | ForEach-Object {Remove-ADGroupMember $groupName  $_ -Confirm:$false}













# Tier 1 ELVAL 
$OUpath = 'OU=T1,OU=Users,OU=Elval,OU=Office,OU=Elval Adm,OU=Vionet,DC=corp,DC=vionet,DC=gr'
$groupName = 't1_el_admins'

$users = Get-ADUser -Filter 'enabled -eq "true"' -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,extensionAttribute15,samAccountName
$members = Get-ADGroupMember -Identity $groupName -Recursive | Select -ExpandProperty SamAccountName
$physicalUsers = @()
$physicalUsersToAdd = @()

foreach ($user in $users) { 	
	$ex=$user.extensionAttribute15;
        $acName = $user.samAccountName;
	if ( $ex -eq "physical" )
	{
		if ( $acName.StartsWith("t1_") ) {
			$physicalUsers += $user
		}
	} 
}

foreach ($user in $physicalUsers ) {
    if (!($members -contains $user)) 
    {
        $physicalUsersToAdd += $user
    }
}
Add-AdGroupMember -Identity $groupName $physicalUsersToAdd 
#Get-ADGroupMember $groupName  | ForEach-Object {Remove-ADGroupMember $groupName  $_ -Confirm:$false}






# Tier 2 ELVAL 
$OUpath = 'OU=T2,OU=Users,OU=Elval,OU=Office,OU=Elval Adm,OU=Vionet,DC=corp,DC=vionet,DC=gr'
$groupName = 't2_el_admins'

$users = Get-ADUser -Filter 'enabled -eq "true"' -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,extensionAttribute15,samAccountName
$members = Get-ADGroupMember -Identity $groupName -Recursive | Select -ExpandProperty SamAccountName
$physicalUsers = @()
$physicalUsersToAdd = @()

foreach ($user in $users) { 
    $ex=$user.extensionAttribute15;
    $acName = $user.samAccountName;
    if ( $ex -eq "physical" )
    {
	if ( $acName.StartsWith("t2_") ) {
		$physicalUsers += $user
	}
    } 
}

foreach ($user in $physicalUsers ) {
    If (!($members -contains $user)) {
        $physicalUsersToAdd += $user
	}
}
Add-AdGroupMember -Identity $groupName $physicalUsersToAdd 
#Get-ADGroupMember $groupName  | ForEach-Object {Remove-ADGroupMember $groupName  $_ -Confirm:$false}

