Install-Module PowerShellGet -Force -AllowClobber
Install-Module AzureADPreview
Install-Module MSOnline
Install-Module ExchangeOnlineManagement
Install-Module MicrosoftTeams
Install-Module -Name Microsoft.Online.SharePoint.PowerShell

Import-Module AzureAD
Import-Module MSOnline
Import-Module ExchangeOnlineManagement
# For MS Exchange OnLine powershell
Set-ExecutionPolicy RemoteSigned
# Requires WinRM client authentication set to BASIC
winrm get winrm/config/client/auth
winrm set winrm/config/client/auth @{Basic="true"}
# Update MS Exchange OnLine Module
Update-Module -Name ExchangeOnlineManagement
# It requires TLS 1.2 protocol
[Net.ServicePointManager]::SecurityProtocol
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 
# Set TLS 1.2 as default on .NET 4
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Wow6432Node\Microsoft.NetFramework\v4.0.30319' -Name 'SchUseStrongCrypto' -Type DWord -Value '1'

Import-Module MicrosoftTeams
# Update SPS OnLine Module
Update-Module -Name Microsoft.Online.SharePoint.PowerShell

Connect-AzureAD
Connect-MSolService
Connect-ExchangeOnline 
Connect-MicrosoftTeams
Connect-SPOService -Url https://viohalco-admin.sharepoint.com