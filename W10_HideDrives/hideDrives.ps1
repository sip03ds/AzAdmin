#hide c: drive

$registryPath = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
$Name = "NoDrives"
$value = "4"
New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType DWORD -Force | Out-Null

$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
$Name = "NoDrives"
$value = "4"
New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType DWORD -Force | Out-Null


