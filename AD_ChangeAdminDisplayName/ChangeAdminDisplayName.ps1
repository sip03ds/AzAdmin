# ANAMET IT ---> IT Department of ANAMET
$personsToChangeAdminDisplayName = @()
$OUpath = 'ou=Anamet_Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName
foreach ($user in $users) {
    $adn=$user.adminDisplayName;
    if ($adn -eq "ANAMET IT") {
        $personsToAdminDisplayName += $user
    }
}

foreach ($personToChangeAdminDisplayName in $personsToAdminDisplayName) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of ANAMET""};"
	Invoke-Expression $command
}

# BRIDGNORTH ALUMINIUM LTD IT ---> IT Department of BRIDGNORTH ALUMINIUM LTD
$personsToChangeAdminDisplayName = @()
$OUpath = 'ou=Anamet_Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName
foreach ($user in $users) {
    $adn=$user.adminDisplayName;
    if ($adn -eq "BRIDGNORTH ALUMINIUM LTD IT") {
        $personsToAdminDisplayName += $user
    }
}

foreach ($personToChangeAdminDisplayName in $personsToAdminDisplayName) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of BRIDGNORTH ALUMINIUM LTD""};"
	Invoke-Expression $command
}

# ELVAL IT ---> IT Department of ELVAL
$personsToChangeAdminDisplayName = @()
$OUpath = 'ou=Anamet_Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName
foreach ($user in $users) {
    $adn=$user.adminDisplayName;
    if ($adn -eq "ELVAL IT") {
        $personsToAdminDisplayName += $user
    }
}

foreach ($personToChangeAdminDisplayName in $personsToAdminDisplayName) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of ELVAL""};"
	Invoke-Expression $command
}

# ETEM BG IT ---> IT Department of ETEM BG
$personsToChangeAdminDisplayName = @()
$OUpath = 'ou=Anamet_Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName
foreach ($user in $users) {
    $adn=$user.adminDisplayName;
    if ($adn -eq "ETEM BG IT") {
        $personsToAdminDisplayName += $user
    }
}

foreach ($personToChangeAdminDisplayName in $personsToAdminDisplayName) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of ETEM BG""};"
	Invoke-Expression $command
}


# ETEM GR IT ---> IT Department of ETEM GR
$personsToChangeAdminDisplayName = @()
$OUpath = 'ou=Anamet_Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName
foreach ($user in $users) {
    $adn=$user.adminDisplayName;
    if ($adn -eq "ETEM GR IT") {
        $personsToAdminDisplayName += $user
    }
}

foreach ($personToChangeAdminDisplayName in $personsToAdminDisplayName) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of ETEM GR""};"
	Invoke-Expression $command
}

# HALCOR IT ---> IT Department of HALCOR
$personsToChangeAdminDisplayName = @()
$OUpath = 'ou=Anamet_Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName
foreach ($user in $users) {
    $adn=$user.adminDisplayName;
    if ($adn -eq "HALCOR IT") {
        $personsToAdminDisplayName += $user
    }
}

foreach ($personToChangeAdminDisplayName in $personsToAdminDisplayName) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of HALCOR""};"
	Invoke-Expression $command
}

# METALIGN GR IT ---> IT Department of METALIGN GR
$personsToChangeAdminDisplayName = @()
$OUpath = 'ou=Anamet_Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName
foreach ($user in $users) {
    $adn=$user.adminDisplayName;
    if ($adn -eq "METALIGN GR IT") {
        $personsToAdminDisplayName += $user
    }
}

foreach ($personToChangeAdminDisplayName in $personsToAdminDisplayName) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of METALIGN GR""};"
	Invoke-Expression $command
}


# REYNOLDS IT ---> IT Department of REYNOLDS
$personsToChangeAdminDisplayName = @()
$OUpath = 'ou=Anamet_Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName
foreach ($user in $users) {
    $adn=$user.adminDisplayName;
    if ($adn -eq "REYNOLDS IT") {
        $personsToAdminDisplayName += $user
    }
}

foreach ($personToChangeAdminDisplayName in $personsToAdminDisplayName) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of REYNOLDS""};"
	Invoke-Expression $command
}



# SIDENOR IT ---> IT Department of SIDENOR 
$personsToChangeAdminDisplayName = @()
$OUpath = 'ou=Anamet_Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName
foreach ($user in $users) {
    $adn=$user.adminDisplayName;
    if ($adn -eq "SIDENOR IT") {
        $personsToAdminDisplayName += $user
    }
}

foreach ($personToChangeAdminDisplayName in $personsToAdminDisplayName) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of SIDENOR""};"
	Invoke-Expression $command
}



# SIDMA IT ---> IT Department of SIDMA
$personsToChangeAdminDisplayName = @()
$OUpath = 'ou=Anamet_Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName
foreach ($user in $users) {
    $adn=$user.adminDisplayName;
    if ($adn -eq "SIDMA IT") {
        $personsToAdminDisplayName += $user
    }
}

foreach ($personToChangeAdminDisplayName in $personsToAdminDisplayName) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of SIDMA""};"
	Invoke-Expression $command
}

# SOFIA MED IT ---> IT Department of SOFIA MED
$personsToChangeAdminDisplayName = @()
$OUpath = 'ou=Anamet_Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName
foreach ($user in $users) {
    $adn=$user.adminDisplayName;
    if ($adn -eq "SOFIA MED IT") {
        $personsToAdminDisplayName += $user
    }
}

foreach ($personToChangeAdminDisplayName in $personsToAdminDisplayName) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of SOFIA MED""};"
	Invoke-Expression $command
}



# STEELMET IT ---> IT Department of STEELMET
$personsToChangeAdminDisplayName = @()
$OUpath = 'ou=Anamet_Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName
foreach ($user in $users) {
    $adn=$user.adminDisplayName;
    if ($adn -eq "STEELMET IT") {
        $personsToAdminDisplayName += $user
    }
}

foreach ($personToChangeAdminDisplayName in $personsToAdminDisplayName) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of STEELMET""};"
	Invoke-Expression $command
}


# TEKA IT ---> IT Department of TEKA
$personsToChangeAdminDisplayName = @()
$OUpath = 'ou=Anamet_Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName
foreach ($user in $users) {
    $adn=$user.adminDisplayName;
    if ($adn -eq "TEKA IT") {
        $personsToAdminDisplayName += $user
    }
}

foreach ($personToChangeAdminDisplayName in $personsToAdminDisplayName) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of TEKA""};"
	Invoke-Expression $command
}

# TEPROMKC IT ---> IT Department of TEPROMKC
$personsToChangeAdminDisplayName = @()
$OUpath = 'ou=Anamet_Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName
foreach ($user in $users) {
    $adn=$user.adminDisplayName;
    if ($adn -eq "TEPROMKC IT") {
        $personsToAdminDisplayName += $user
    }
}

foreach ($personToChangeAdminDisplayName in $personsToAdminDisplayName) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of TEPROMKC""};"
	Invoke-Expression $command
}


# VIOMAL IT ---> IT Department of VIOMAL
$personsToChangeAdminDisplayName = @()
$OUpath = 'ou=Anamet_Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName
foreach ($user in $users) {
    $adn=$user.adminDisplayName;
    if ($adn -eq "VIOMAL IT") {
        $personsToAdminDisplayName += $user
    }
}

foreach ($personToChangeAdminDisplayName in $personsToAdminDisplayName) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of VIOMAL""};"
	Invoke-Expression $command
}


# VERSION 1 - RETAIN

# ETEM GESTAMP IT ---> IT Department of ETEM BG
$personsToChangeAdminDisplayName = @()
$OUpath = 'ou=Anamet_Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName
foreach ($user in $users) {
    $adn=$user.adminDisplayName;
    if ($adn -eq "ETEM GESTAMP IT") {
        $personsToAdminDisplayName += $user
    }
}

foreach ($personToChangeAdminDisplayName in $personsToAdminDisplayName) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of ETEM BG""};"
	Invoke-Expression $command
}


# CABLEL IT ---> IT Department of CABLEL
$personsToChangeAdminDisplayName = @()
$OUpath = 'ou=Anamet_Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName
foreach ($user in $users) {
    $adn=$user.adminDisplayName;
    if ($adn -eq "CABLEL IT") {
        $personsToAdminDisplayName += $user
    }
}

foreach ($personToChangeAdminDisplayName in $personsToAdminDisplayName) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of CABLEL""};"
	Invoke-Expression $command
}

# CPW IT ---> IT Department of CPW
$personsToChangeAdminDisplayName = @()
$OUpath = 'ou=Anamet_Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName
foreach ($user in $users) {
    $adn=$user.adminDisplayName;
    if ($adn -eq "CPW IT") {
        $personsToAdminDisplayName += $user
    }
}

foreach ($personToChangeAdminDisplayName in $personsToAdminDisplayName) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of CPW""};"
	Invoke-Expression $command
}

# CENERGY IT ---> IT Department of CENERGY
$personsToChangeAdminDisplayName = @()
$OUpath = 'ou=Anamet_Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName
foreach ($user in $users) {
    $adn=$user.adminDisplayName;
    if ($adn -eq "CENERGY IT") {
        $personsToAdminDisplayName += $user
    }
}

foreach ($personToChangeAdminDisplayName in $personsToAdminDisplayName) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of CENERGY""};"
	Invoke-Expression $command
}

# DOJRAN STEEL IT ---> IT Department of DOJRAN STEEL
$personsToChangeAdminDisplayName = @()
$OUpath = 'ou=Anamet_Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName
foreach ($user in $users) {
    $adn=$user.adminDisplayName;
    if ($adn -eq "DOJRAN STEEL IT") {
        $personsToAdminDisplayName += $user
    }
}

foreach ($personToChangeAdminDisplayName in $personsToAdminDisplayName) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of DOJRAN STEEL""};"
	Invoke-Expression $command
}

# STOMANA IT ---> IT Department of STOMANA
$personsToChangeAdminDisplayName = @()
$OUpath = 'ou=Anamet_Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName
foreach ($user in $users) {
    $adn=$user.adminDisplayName;
    if ($adn -eq "STOMANA IT") {
        $personsToAdminDisplayName += $user
    }
}

foreach ($personToChangeAdminDisplayName in $personsToAdminDisplayName) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of STOMANA""};"
	Invoke-Expression $command
}

# SOVEL IT ---> IT Department of SOVEL
$personsToChangeAdminDisplayName = @()
$OUpath = 'ou=Anamet_Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName
foreach ($user in $users) {
    $adn=$user.adminDisplayName;
    if ($adn -eq "SOVEL IT") {
        $personsToAdminDisplayName += $user
    }
}

foreach ($personToChangeAdminDisplayName in $personsToAdminDisplayName) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of SOVEL""};"
	Invoke-Expression $command
}

# ICME IT ---> IT Department of ICME 
$personsToChangeAdminDisplayName = @()
$OUpath = 'ou=Anamet_Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName
foreach ($user in $users) {
    $adn=$user.adminDisplayName;
    if ($adn -eq "ICME IT") {
        $personsToAdminDisplayName += $user
    }
}

foreach ($personToChangeAdminDisplayName in $personsToAdminDisplayName) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of ICME""};"
	Invoke-Expression $command
}


# VERSION 2 - CHANGE


# ETEM GESTAMP IT ---> IT Department of ETEM BG
$personsToChangeAdminDisplayName = @()
$OUpath = 'ou=Anamet_Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName
foreach ($user in $users) {
    $adn=$user.adminDisplayName;
    if ($adn -eq "ETEM GESTAMP IT") {
        $personsToAdminDisplayName += $user
    }
}

foreach ($personToChangeAdminDisplayName in $personsToAdminDisplayName) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of ETEM BG""};"
	Invoke-Expression $command
}


# CABLEL IT ---> IT Department of CENERGY
$personsToChangeAdminDisplayName = @()
$OUpath = 'ou=Anamet_Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName
foreach ($user in $users) {
    $adn=$user.adminDisplayName;
    if ($adn -eq "CABLEL IT") {
        $personsToAdminDisplayName += $user
    }
}

foreach ($personToChangeAdminDisplayName in $personsToAdminDisplayName) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of CENERGY""};"
	Invoke-Expression $command
}

# CPW IT ---> IT Department of CPW
$personsToChangeAdminDisplayName = @()
$OUpath = 'ou=Anamet_Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName
foreach ($user in $users) {
    $adn=$user.adminDisplayName;
    if ($adn -eq "CPW IT") {
        $personsToAdminDisplayName += $user
    }
}

foreach ($personToChangeAdminDisplayName in $personsToAdminDisplayName) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of CENERGY""};"
	Invoke-Expression $command
}

# CENERGY IT ---> IT Department of CENERGY
$personsToChangeAdminDisplayName = @()
$OUpath = 'ou=Anamet_Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName
foreach ($user in $users) {
    $adn=$user.adminDisplayName;
    if ($adn -eq "CENERGY IT") {
        $personsToAdminDisplayName += $user
    }
}

foreach ($personToChangeAdminDisplayName in $personsToAdminDisplayName) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of CENERGY""};"
	Invoke-Expression $command
}

# DOJRAN STEEL IT ---> IT Department of SIDENOR
$personsToChangeAdminDisplayName = @()
$OUpath = 'ou=Anamet_Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName
foreach ($user in $users) {
    $adn=$user.adminDisplayName;
    if ($adn -eq "DOJRAN STEEL IT") {
        $personsToAdminDisplayName += $user
    }
}

foreach ($personToChangeAdminDisplayName in $personsToAdminDisplayName) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of SIDENOR""};"
	Invoke-Expression $command
}

# STOMANA IT ---> IT Department of SIDENOR
$personsToChangeAdminDisplayName = @()
$OUpath = 'ou=Anamet_Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName
foreach ($user in $users) {
    $adn=$user.adminDisplayName;
    if ($adn -eq "STOMANA IT") {
        $personsToAdminDisplayName += $user
    }
}

foreach ($personToChangeAdminDisplayName in $personsToAdminDisplayName) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of SIDENOR""};"
	Invoke-Expression $command
}

# SOVEL IT ---> IT Department of SIDENOR
$personsToChangeAdminDisplayName = @()
$OUpath = 'ou=Anamet_Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName
foreach ($user in $users) {
    $adn=$user.adminDisplayName;
    if ($adn -eq "SOVEL IT") {
        $personsToAdminDisplayName += $user
    }
}

foreach ($personToChangeAdminDisplayName in $personsToAdminDisplayName) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of SIDENOR""};"
	Invoke-Expression $command
}

# ICME IT ---> IT Department of ICME 
$personsToChangeAdminDisplayName = @()
$OUpath = 'ou=Anamet_Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName
foreach ($user in $users) {
    $adn=$user.adminDisplayName;
    if ($adn -eq "ICME IT") {
        $personsToAdminDisplayName += $user
    }
}

foreach ($personToChangeAdminDisplayName in $personsToAdminDisplayName) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of CENERGY""};"
	Invoke-Expression $command
}


# VERSION 3 - UPGRADE

# ETEM GESTAMP IT ---> IT Department of ETEM BG
$personsToChangeAdminDisplayName = @()
$OUpath = 'ou=Anamet_Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName
foreach ($user in $users) {
    $adn=$user.adminDisplayName;
    if ($adn -eq "IT Department of ETEM GESTAMP") {
        $personsToAdminDisplayName += $user
    }
}

foreach ($personToChangeAdminDisplayName in $personsToAdminDisplayName) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of ETEM BG""};"
	Invoke-Expression $command
}


# CABLEL IT ---> IT Department of CENERGY
$personsToChangeAdminDisplayName = @()
$OUpath = 'ou=Anamet_Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName
foreach ($user in $users) {
    $adn=$user.adminDisplayName;
    if ($adn -eq "IT Department of CABLEL") {
        $personsToAdminDisplayName += $user
    }
}

foreach ($personToChangeAdminDisplayName in $personsToAdminDisplayName) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of CENERGY""};"
	Invoke-Expression $command
}

# CPW IT ---> IT Department of CPW
$personsToChangeAdminDisplayName = @()
$OUpath = 'ou=Anamet_Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName
foreach ($user in $users) {
    $adn=$user.adminDisplayName;
    if ($adn -eq "IT Department of CPW") {
        $personsToAdminDisplayName += $user
    }
}

foreach ($personToChangeAdminDisplayName in $personsToAdminDisplayName) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of CENERGY""};"
	Invoke-Expression $command
}

# ICME IT ---> IT Department of CENERGY 
$personsToChangeAdminDisplayName = @()
$OUpath = 'ou=Anamet_Adm,ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(enabled -eq 'true')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName
foreach ($user in $users) {
    $adn=$user.adminDisplayName;
    if ($adn -eq "IT Department of ICME") {
        $personsToAdminDisplayName += $user
    }
}

foreach ($personToChangeAdminDisplayName in $personsToAdminDisplayName) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of CENERGY""};"
	Invoke-Expression $command
}















# IT Department of ANAMET ---> IT Department of SIDENOR
$OUpath = 'dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(adminDisplayName -eq 'IT Department of ANAMET')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName

foreach ($personToChangeAdminDisplayName in $users) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of SIDENOR""};"
	Invoke-Expression $command
}

# IT Department of DOJRAN STEEL ---> IT Department of SIDENOR
$OUpath = 'dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(adminDisplayName -eq 'IT Department of DOJRAN STEEL')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName

foreach ($personToChangeAdminDisplayName in $users) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of SIDENOR""};"
	Invoke-Expression $command
}

# IT Department of SOVEL ---> IT Department of SIDENOR
$OUpath = 'dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(adminDisplayName -eq 'IT Department of SOVEL')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName

foreach ($personToChangeAdminDisplayName in $users) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of SIDENOR""};"
	Invoke-Expression $command
}

# IT Department of STOMANA ---> IT Department of SIDENOR
$OUpath = 'ou=VIONET,dc=corp,dc=vionet,dc=gr'
$users = Get-ADUser -Filter "(adminDisplayName -eq 'IT Department of STOMANA')" -SearchBase $OUpath -properties * | select SID,Surname,GivenName,mail,company,msNPAllowDialin,adminDisplayName,department,telephoneNumber,mobile,extensionAttribute15,extensionAttribute14,sAMAccountName,distinguishedName,UserPrincipalName

foreach ($personToChangeAdminDisplayName in $users) {
	$command = "Set-ADUser –Identity $($personToChangeAdminDisplayName.sAMAccountName) -Replace  @{""adminDisplayName""=""IT Department of SIDENOR""};"
	Invoke-Expression $command
}

