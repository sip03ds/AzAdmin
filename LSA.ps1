$key = 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\'
$value = 'RunAsPPL'

if (Test-Path $key)  {
    try {
        $timi = Get-ItemPropertyValue $key -Name $value
        Set-ItemProperty -Path $key -Name $value -Value "1"
    }
    catch {
        New-ItemProperty -Path $key -Name $value -Value "1" -PropertyType DWORD -Force
    } 
} 