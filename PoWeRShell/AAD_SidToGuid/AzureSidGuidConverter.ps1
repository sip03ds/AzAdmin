function Convert-AzureAdSidToObjectId {
	<#
	.SYNOPSIS
	Convert a Azure AD SID to Object ID
	 
	.DESCRIPTION
	Converts an Azure AD SID to Object ID.
	Author: Oliver Kieselbach (oliverkieselbach.com)
	The script is provided "AS IS" with no warranties.
	 
	.PARAMETER ObjectID
	The SID to convert
	#>

    param([String] $Sid)

    $text = $sid.Replace('S-1-12-1-', '')
    $array = [UInt32[]]$text.Split('-')

    $bytes = New-Object 'Byte[]' 16
    [Buffer]::BlockCopy($array, 0, $bytes, 0, 16)
    [Guid]$guid = $bytes

    return $guid
}



function Convert-AzureAdObjectIdToSid {
<#
.SYNOPSIS
Convert an Azure AD Object ID to SID
 
.DESCRIPTION
Converts an Azure AD Object ID to a SID.
Author: Oliver Kieselbach (oliverkieselbach.com)
The script is provided "AS IS" with no warranties.
 
.PARAMETER ObjectID
The Object ID to convert
#>

    param([String] $ObjectId)

    $bytes = [Guid]::Parse($ObjectId).ToByteArray()
    $array = New-Object 'UInt32[]' 4

    [Buffer]::BlockCopy($bytes, 0, $array, 0, 16)
    $sid = "S-1-12-1-$array".Replace(' ', '-')

    return $sid
}

connect-azuread
# Output:

# Guid
# ----
# 73d664e4-0886-4a73-b745-c694da45ddb4
$sid = "S-1-12-1-3342641245-1154088511-1947536292-1359401020"
$objectId = Convert-AzureAdSidToObjectId -Sid $sid
Write-Output $sid
Write-Output $objectId

Get-AzureADObjectByObjectId -ObjectIds "$objectId"

$sid = "S-1-12-1-821456255-1132162575-59504812-2212511807"
$objectId = Convert-AzureAdSidToObjectId -Sid $sid
Write-Output $sid
Write-Output $objectId

Get-AzureADObjectByObjectId -ObjectIds "$objectId"

$sid = "S-1-12-1-1943430372-1249052806-2496021943-3034400218"
$objectId = Convert-AzureAdSidToObjectId -Sid $sid
Write-Output $sid
Write-Output $objectId

Get-AzureADObjectByObjectId -ObjectIds "$objectId"



$objectId = "e884dc4e-c830-435f-814d-70da431d322c"
$sid= Convert-AzureAdObjectIdToSid -ObjectId $objectId
Write-Output "$sid"

Write-Output "Tier 2 users of IT Department of BRIDGNORTH ALUMINIUM LTD"
$objectId = "f32d7d35-f477-4086-9ad9-9a9f9e8962e1"
$sid= Convert-AzureAdObjectIdToSid -ObjectId $objectId
Write-Output "$sid"

Write-Output "Tier 2 users of IT Department of CPW"
$objectId = "e0b73655-f3a8-4c5b-b1a2-d9182070cf5e"
$sid= Convert-AzureAdObjectIdToSid -ObjectId $objectId
Write-Output "$sid"

Write-Output "Tier 2 users of IT Department of SOVEL"
$objectId = "dbf26c51-f1b1-493f-8549-d0f6ca48ac6d"
$sid= Convert-AzureAdObjectIdToSid -ObjectId $objectId
Write-Output "$sid"

Write-Output "Tier 2 users of IT Department of ETEM BG"
$objectId = "d95cfdb1-5ba6-4834-91b3-8697b555de8a"
$sid= Convert-AzureAdObjectIdToSid -ObjectId $objectId
Write-Output "$sid"

Write-Output "Tier 2 users of IT Department of VIOMAL"
$objectId = "9d4d11c1-af51-4ca7-8f7c-f587bc77242c"
$sid= Convert-AzureAdObjectIdToSid -ObjectId $objectId
Write-Output "$sid"

Write-Output "Tier 2 users of IT Department of METALIGN GR"
$objectId = "8e1aab8c-e4ef-4267-b46e-431d82f132c3"
$sid= Convert-AzureAdObjectIdToSid -ObjectId $objectId
Write-Output "$sid"

Write-Output "Tier 2 users of IT Department of ETEM GR"
$objectId = "8cc9ee9a-9e7f-422f-8b1d-7c576ffb3bc4"
$sid= Convert-AzureAdObjectIdToSid -ObjectId $objectId
Write-Output "$sid"

Write-Output "Tier 2 users of IT Department of TEKA"
$objectId = "89ad6d11-61af-4052-b314-f384c37a5263"
$sid= Convert-AzureAdObjectIdToSid -ObjectId $objectId
Write-Output "$sid"

Write-Output "Tier 2 users of IT Department of ELVAL"
$objectId = "7f85e7d2-8f64-4eac-b1f4-5beaa77f7ca0"
$sid= Convert-AzureAdObjectIdToSid -ObjectId $objectId
Write-Output "$sid"

Write-Output "Tier 2 users of IT Department of STOMANA"
$objectId = "679f7a1f-3791-4d94-8e02-cf15032004b9"
$sid= Convert-AzureAdObjectIdToSid -ObjectId $objectId
Write-Output "$sid"

Write-Output "Tier 2 users of IT Department of SIDMA"
$objectId = "67194d9e-37da-4178-830a-bcf43408b844"
$sid= Convert-AzureAdObjectIdToSid -ObjectId $objectId
Write-Output "$sid"

Write-Output "Tier 2 users of IT Department of ANAMET"
$objectId = "6328b561-1ee9-4287-a4a8-54f5ae3cb1b3"
$sid= Convert-AzureAdObjectIdToSid -ObjectId $objectId
Write-Output "$sid"

Write-Output "Tier 2 users of IT Department of HALCOR"
$objectId = "43193828-534d-454c-9abe-48c6603069da"
$sid= Convert-AzureAdObjectIdToSid -ObjectId $objectId
Write-Output "$sid"

Write-Output "Tier 2 users of IT Department of DOJRAN STEEL"
$objectId = "32731680-a096-4552-b1c4-3ed04ee4bf5a"
$sid= Convert-AzureAdObjectIdToSid -ObjectId $objectId
Write-Output "$sid"

Write-Output "Tier 2 users of IT Department of ICME"
$objectId = "2d3d9ae3-ba7c-4384-84eb-7cb57604dc62"
$sid= Convert-AzureAdObjectIdToSid -ObjectId $objectId
Write-Output "$sid"

Write-Output "Tier 2 users of IT Department of CABLEL"
$objectId = "20d40efa-543f-43c1-bfb9-2ea06a3c5a70"
$sid= Convert-AzureAdObjectIdToSid -ObjectId $objectId
Write-Output "$sid"

Write-Output "Tier 2 users of IT Department of SOFIA MED"
$objectId = "1f0ea0c4-ad1a-4e70-990d-d8fc8011af26"
$sid= Convert-AzureAdObjectIdToSid -ObjectId $objectId
Write-Output "$sid"

Write-Output "Tier 2 users of IT Department of SIDENOR"
$objectId = "0da01a0b-4a36-4e37-b252-8f65b4ba3ce2"
$sid= Convert-AzureAdObjectIdToSid -ObjectId $objectId
Write-Output "$sid"

Write-Output "SID: S-1-12-1-3901021262-1130350640-3664792961-741481795"
# Tier 2 users of IT Department of STEELMET
$sid = "S-1-12-1-3901021262-1130350640-3664792961-741481795"
$objectId = Convert-AzureAdSidToObjectId -sid $sid
Write-Output "$objectId"
Get-AzureADObjectByObjectId $objectId

Write-Output "SID: S-1-12-1-3342641245-1154088511-1947536292-1359401020"
# 
$sid = "S-1-12-1-3342641245-1154088511-1947536292-1359401020"
$objectId = Convert-AzureAdSidToObjectId -sid $sid
Write-Output "$objectId"
Get-AzureADObjectByObjectId $objectId

Write-Output "SID: S-1-12-1-821456255-1132162575-59504812-2212511807"
# 
$sid = "S-1-12-1-821456255-1132162575-59504812-2212511807"
$objectId = Convert-AzureAdSidToObjectId -sid $sid
Write-Output "$objectId"
Get-AzureADObjectByObjectId $objectId


Write-Output "Tier 2 users of IT Department of TEPROMKC"
$objectId = "03e6ecd4-c850-4a03-a038-f65ecc574215"
$sid= Convert-AzureAdObjectIdToSid -ObjectId $objectId
Write-Output "$sid"