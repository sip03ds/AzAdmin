Connect-MSGraph -ClientSecret $clientSecret

$Grouptag = "CLOUD_SIDENOR" #Specify the GroupTag Here
$SerialNumbers = Get-Content -Path "SerialNumber.txt" #Provide the list of devices you want to check the GroupTag
foreach ($Serial in $SerialNumbers)
{
    $Serial
    Get-AutopilotDevice -serial $Serial | Set-AutopilotDevice -groupTag $Grouptag
}