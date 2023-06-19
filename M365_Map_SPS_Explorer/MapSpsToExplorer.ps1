Import-Module MicrosoftTeams

$tenantID = "ac16fc13-eed0-45a8-a4cd-092120207ca4"
$credential = Get-Credential
$siteUrl = 'https://viohalco-admin.sharepoint.com'

Connect-MicrosoftTeams -Credential $credential
Connect-AzureAD -Credential $credential
Connect-MsolService -Credential $credential
Connect-SPOService -Url $siteUrl -Credential $credential

$teams = Get-Team -User $credential.UserName

foreach ($team in $teams) {
	$team
	Get-UnifiedGroup | select DisplayName, SharePointSiteUrl # Requires MS Exchange OnLime Module - activation of OpenAuth upgrade to 2016 
}


<#

$Teams = (Get-Team |Select GroupId, DisplayName)
ForEach ($T in $Teams) {
   $SPOURl = (Get-UnifiedGroup -Identity $T.GroupId | Select -ExpandProperty SharePointSiteURL)
   Write-Host "URL for the" $T.DisplayName "team is" $SPOURL }
   
   
   
   
   

$OneDriveRegistryPath = "HKCU:\SOFTWARE\Policies\Microsoft\OneDrive\TenantAutoMount"

#Silently sign in users to the OneDrive sync client with their Windows credentials
$LibraryName = "SharePoint_Library_Name"
$LibraryID = "LibraryID_from_SharePoint_Site_Sync"
If(!(Test-Path $OneDriveRegistryPath))
{
	New-Item -Path $OneDriveRegistryPath -Force | Out-Null
	New-ItemProperty -Path $OneDriveRegistryPath -Name $LibraryName -Value $LibraryID -PropertyType STRING -Force | Out-Null
}
Else
{
	New-ItemProperty -Path $OneDriveRegistryPath -Name $LibraryName -Value $LibraryID -PropertyType STRING -Force | Out-Null
}

#>