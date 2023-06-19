<#
Version: 1.0
Author: Jannik Reinhard (jannikreinhard.com)
Script: Change-DeviceCategory
Description:
The script helps you to change the category of an intune device
Release notes:
Version 1.0: Init
#> 

# Install-Module Microsoft.Graph -Scope AllUsers       
# Install-Module Microsoft.Graph.Intune
# Install-Module -Name MSGraph.PS
# Install-Module MSAL.PS
# Install-Module -Name Microsoft.Graph.Intune

# Import-Module Microsoft.Graph
# Select-MgProfile -Name "beta"
# Connect-MgGraph -Scopes "User.ReadWrite.All","Group.ReadWrite.All","DeviceManagementManagedDevices.ReadWrite.All"

# Import-Module MSGraph.PS
Import-Module Microsoft.Graph.Intune
Connect-MSGraph
Update-MSGraphEnvironment -SchemaVersion 'beta'


function Change-DeviceCategory {
	param(
		[Parameter(Mandatory)]
		[string]$DeviceID,
		
		[Parameter(Mandatory)]
		[string]$DeviceCategory
	)

    
    $body = @{ "@odata.id" = "https://graph.microsoft.com/beta/deviceManagement/deviceCategories/$DeviceCategory" }
    Invoke-MSGraphRequest -HttpMethod PUT -Url "deviceManagement/managedDevices/$DeviceID/deviceCategory/`$ref" -Content $body

}

$DeviceID = '81fc90e3-e188-48a3-b0e5-fb87656d158e'
$DeviceCategory = '1a94125e-d4b1-463c-a940-27ef13c1ffdb'


# "1a94125e-d4b1-463c-a940-27ef13c1ffdb" #"IT Department of ANAMET"
# "95d0c412-37f6-444a-943f-255abf09e796" #"IT Department of BRIDGNORTH ALUMINIUM LTD"
# "56886287-897b-440b-96ff-f95a1ef5c8aa" #"IT Department of CABLEL"
# "84cf7a20-2772-4fa0-9328-c398fdcd9063" #"IT Department of CPW"
# "cfeb3788-f741-4a0e-8a18-472ef8cef34a" #"IT Department of DOJRAN STEEL"
# "88ae13f5-1a8b-41f1-a0f9-860eb19b143f" #"IT Department of ELVAL"
# "35666143-eb24-49e9-92bc-d6238248c410" #"IT Department of ETEM BG"
# "8bacd8fc-5cd1-4db4-96e9-584442974db6" #"IT Department of ETEM GR"
# "1ccf2e5f-5495-4c54-90d2-17875833467f" #"IT Department of HALCOR"
# "b2b8c9f6-0b23-4456-92b1-b984e8dcdc53" #"IT Department of ICME"
# "319dde09-42ff-4fda-a493-431557060137" #"IT Department of METALIGN GR"
# "5be9ce0c-9e60-448c-bd87-393975523276" #"IT Department of SIDENOR"
# "50f904f7-5452-4f36-9bcc-882fd3b1cd03" #"IT Department of SIDMA"
# "8d130e2d-ba17-4da7-aa14-d58ef8dbabd7" #IT Department of SOFIA MED"
# "231bf089-51c3-460b-b5c4-477d65e93322" #"IT Department of SOVEL"
# "7556ffa9-33cc-4427-b464-47c30d6a33c3" #IT Department of STEELMET"
# "e8c48b6a-9076-4ef5-b571-1a3bf9c5d8f8" #"IT Department of STOMANA"
# "ca5094d0-dd52-4b50-8e01-e134b9fa1d41" #"IT Department of TEKA"
# "b19c2339-dd62-417a-9a11-27920ae55659" #"IT Department of VIOMAL"
# "4065b510-1fc3-4dd6-a5f1-a6789138d67a" #"IT Department of TEPROMKC"


Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory
