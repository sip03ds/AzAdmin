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

$DeviceId='2078e5c2-53ca-4e19-84bb-9b91ae6ee268';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='9a454c87-f832-4148-a1eb-c5cc860f7298';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='51fd7d41-407c-4777-810b-9b306c89c5a8';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='1139e3a0-d641-486e-8489-8728b5e326f4';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='9e1382de-9291-4b7d-8ac5-3e5d16c7fb57';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='5bee2110-bc8a-45f9-9fe2-c26c9030b427';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='4ba4790f-ca07-441b-830e-76b53a9fe3c8';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='ce85219f-3d75-41a9-a7a2-cebad512a254';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='2291f8b7-b372-48de-8cae-10b9a2df2188';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='40aabe5c-6553-4a64-bc6b-5f007abf3ecc';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='3af950ab-202f-4ed2-97ee-113583e89c57';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='9bc8c105-5a05-4aa8-bb65-91b5ee5e8fd9';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='2ae1d7cd-83a9-48be-a3eb-278156479c91';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='fa39e8c6-a479-4731-970d-0e2542ca5fa7';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='87c21727-e84d-4c46-9f17-99be13830e7a';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='3ad0b806-5c44-419d-a0c7-6a69f8575a20';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='26b4713e-aa15-4eb5-a414-63bf2ab86acd';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='154896a2-2aad-4962-9b3a-98c12aeb4fe9';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='bca2b6fb-8bd6-48d5-b1f8-854a9c8dc59b';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='5c382437-4f59-4cb6-8c18-a2321cf1f4b2';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='9ce9e30a-8229-4777-956e-9640b8a8cffd';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='0ae35aab-b505-44b4-85f9-456aaf67a16e';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='d5a751d9-bda1-4b05-b632-0431f966aeac';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='ea83bb34-6ed0-41ef-b95e-a39154aeabbd';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='5df5ed04-8010-43ab-b808-de1510b6fd10';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='a50b62d9-602c-4303-b1cb-f7b6e5cc5c55';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='c5d6750e-7296-4e15-bd06-f888d0604775';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='c55bf325-da52-45d1-bdf4-57c650013b8b';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='16aabb6a-b5b4-4dff-9249-1c3e554b8910';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='44cbbc05-9be2-411c-80aa-b78e88d32fd4';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='f5b5814f-008a-468c-b10d-89d78f6f25d4';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='91c56d84-90d1-40df-8a62-c17574bfebdf';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='9ccb6a74-4a71-45df-a3cc-373ff4834373';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='f0f17fd1-d83d-4504-aa8b-b1b91072e432';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='00129b36-c5fb-4760-93b3-3f8a46a04374';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='7f9c5ff1-7d93-41d9-984e-1849265500df';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='bf791ed9-9f8c-46b9-90e7-d5e13d0d80b6';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='003a5c4d-f07b-4392-9113-579799e92ef6';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='728e703a-fb07-44a7-847d-2174f6f878fc';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='f057ddc7-39ac-4a13-8297-c2f0b31d7f91';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='81e91aff-6cd3-4dd2-82ad-f69a2af20b31';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='d85de749-edbd-4a57-89ea-ed4789b90e00';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='4f4f23a9-9070-4d25-b26c-77e37851152e';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='d3298131-b47d-496e-af8f-fe30778c2f15';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='6839a41f-d774-4178-8df0-b3baea74e6bb';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='cc9fb049-f1aa-4b6e-aa87-32cf467c8795';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='c105b8eb-f36b-41d8-8ca3-9a535830f2dc';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='5bd2c6d2-6531-4627-817b-e4656a169ff3';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='d0c07fe4-1253-4a81-a21b-2024b686b2ea';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='dbe081d4-9cf0-416d-9870-f1ca4c4239eb';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='fff8fd19-84f7-4308-a143-dddc27b7fda1';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='935a6d11-07ee-4300-af7a-7f0e06aaa6ca';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='aaedf9f5-62d7-4706-983b-dff70df5fc17';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='b84dc54b-8a14-460c-8875-786c88c7739a';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='47a53a8b-3806-4ba5-b70b-24fb43426e07';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='bbb8bae5-6b0b-41a8-a67e-fd906202aed9';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='165dd3ea-1c40-4398-9543-1a0c31f8dcde';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='da238d7d-c273-489a-aff4-b49b94d2ea0f';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='dcbe6633-97ed-4148-a1fa-7b104a418974';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='3fca588b-3038-4ddc-9b27-49919ae149ae';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='0b0cc2e4-0a12-4e9e-8892-4c703eb4421e';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='750f16ba-f8ab-452f-a427-b328281d7eb3';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='2c3d3d01-1430-4e16-9a38-3f533bd9fd9c';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='ceed09cc-10ec-47e4-adc7-679a8f93ec2e';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='51f350f0-843d-40d6-abb8-2b3f822dd993';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='38409343-1649-4f0e-a2de-e44e3e0c81ea';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='6b87c0b4-325d-4e17-8afc-d91eb5615a27';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='97837b25-eb14-4f5d-b653-e9dae9a3b51d';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='c83ec60d-dc3c-402f-8e30-0f6ef6e64fd9';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='72d84e30-0ab5-4453-8278-671f33f92165';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='7bac7a81-78b1-406e-8e7e-ad269a0293f9';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='ebbea031-7fb7-41da-8e94-8cd4e201f7f8';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='289e9425-595a-4f3c-bcc7-54ccc21d0edc';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='b033ca44-d47c-43e4-a36b-30f75cf46299';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='859d691f-2b00-4f71-b39d-e1f2bd1dbdad';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='f48b1596-b36d-44bd-bee9-a5d48dae990a';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='216f675e-6352-4218-825e-0c0f26cca8aa';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='67149efb-ef18-4851-8103-af200ab13452';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='6bfa344a-74c6-4258-937d-e47aed80be8c';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='ba6f6eaf-e012-4828-a3e5-c8a419a22330';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='2c660cf9-9ed4-4b4c-8d6c-b530f1a9cd5d';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='e09f0f6e-42b1-4ebd-8ee4-7e3cd6b549f5';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='28b0fe3c-dcc7-4e7e-b971-c418792e5cc1';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='49b77e21-efed-45bb-aeec-c8c074c1a0d3';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='fc335314-6d24-4fbc-874a-c9d36939e854';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='123f6d4e-104c-44ce-b432-566aa06ad3a1';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='9cda9f0f-5764-40a2-9592-f4bef0932242';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='f13ebf52-48f2-4646-a77c-73151be4e1c5';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='ac3d4325-b897-4830-a86a-06b8d7a54f33';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='30e365e1-aafd-49cd-97e6-bad9ea9b68fb';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='d52b0792-d690-4c26-bba5-aa480283742a';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='5f6f1161-b54f-416e-a56c-3ef6e5fbee1d';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='0eb768c7-e83e-4385-ab81-26ff15ba3ff0';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='15df39ad-ad2b-4bf8-9d1d-c93746ded974';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='52db2b69-a919-4285-a4fa-68748452a593';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='0f552ae5-5176-4a5b-a205-135661d3300d';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='1e7d7ac1-4807-4a6b-8fc5-7701f05eaa79';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='69d9b18c-3a32-427f-bebf-0919c50c7439';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='38834a8c-9b80-433d-ba12-6810514a946c';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='dc1a3964-bb6b-4557-b623-b31f3635e7de';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='17fbf444-9bd0-4607-b45b-322d45fe5942';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='0f5ce5c7-f0fc-4643-873a-6f206ba8926b';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='fd1ba586-9fd2-4685-9785-c5878a614347';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='92eeca3d-34ef-410c-9efd-78da0bf6b3c8';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='ff8021de-fd78-45ef-881a-0d146a900955';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='e2eef006-51fc-48bb-8fe6-196a8c4ccaa3';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='b6e601e2-a0ea-4351-9b7a-a89e475cc830';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='c4e01bf1-096b-46db-83d2-c502d0b52ca8';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='aafc1964-a932-4a94-b845-ce04723757cc';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='356dfc11-324f-4a64-ac65-5ccc75c34fc9';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='3a93eb16-b002-496e-81df-7092ffa117cf';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='be22d45d-89b5-4724-ba43-f17567f6bebe';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='8bcf391d-a2d2-46ed-8434-f27203a6500f';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='bb09d64b-44aa-453e-99ed-26de2c546a6e';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='0134f363-7aae-458a-8363-182ec60fa63c';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='0e23a6a6-c3da-45b8-97ea-598736f28550';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='ab8ff567-d828-4de8-8b2c-0a72fe4bf889';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='a07eb29b-7b92-4ef8-82ad-88633e1f31da';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='1fea31ef-8785-4a7c-b3f6-117be456d7b9';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='2847380a-fa8a-4917-b712-66c1db5f03f1';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='9aae1e40-ddd5-49b0-8440-e39d89369fd0';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='afd23ab4-24bf-4c79-81ad-05c90130a8ca';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='405e1892-4470-4b0e-93e0-516f46e6501d';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='0792327d-3d81-495f-ab7d-91c067ee3e5a';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='821967bf-6742-4816-b89c-9c72b195a7af';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='6f503916-1b08-460c-ba35-3252dfadde50';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='d3c1bc9c-26f4-451c-94a9-05a9e231fe36';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='5e731fac-5afd-40cf-8f30-a3652f41ce50';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='258d4e6f-6dfd-4aea-a780-94f1b895e616';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='08a2cb4e-b2e4-49d6-b52f-abb046cdf460';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='81fc90e3-e188-48a3-b0e5-fb87656d158e';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='46778a3a-c362-41a9-a1d6-bd5c26117674';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='2f3e3474-38fb-4f5a-b995-7921a61ecc25';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='df781eb9-e999-4004-8de4-a91897f6512a';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='fb7b3349-205e-4715-9e4c-fc2cc004f5c9';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='87b33914-5e22-4bd5-80b1-0503b5c29149';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='059f8f70-5d45-4885-960f-07d582b8858f';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='7bfc0f5d-0dab-490e-b4d6-e988b2f52dcc';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='10659c47-84d1-4bbe-8667-c792991370d4';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='3b91335a-fd9f-4d8f-851c-103549aa9327';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='64062b98-556d-4fc8-a2d6-43e29aa14781';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='dea214c5-e84f-4d5e-bb52-cb36eb6cb6b8';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='a7948550-f3fe-471c-8538-ca6251005a2e';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='02168774-f836-463e-94a8-b39243174348';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='010c41c5-30bc-4755-9013-93b2d4d4edb6';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='383dfb7e-2dce-4fd1-9871-86f1b4f30da2';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='412dcbb8-33db-47ce-a629-dae74914bce3';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='227fdd36-6e61-4a9d-b74b-5330b70b2787';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='40bfd992-3c5c-42e9-a46e-a54ab3c692db';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='794a6427-9a2d-47c0-a31d-676f7f0c62b9';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='61fededd-945b-4e46-bd2c-6d38092a4341';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='64469319-adb7-4153-ae14-56b10f3f38d7';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='3a95e836-8d86-41c9-89cf-31ef1401e56b';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='813e6a77-9be8-4fec-820f-ff2f1d889c3e';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='31901020-6f92-413c-acff-6a3228854bec';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='252a229b-9d13-4e93-b967-5579c2aa4d18';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='dbacf7f9-3d64-4a5f-9dad-294d6c0c18a7';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='f9a45ee1-4e3d-4c62-8eae-c2c179042de0';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='d54626c0-1366-4de5-9302-07605e5fe3e9';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='c7a7aec8-df80-45f2-b687-14c24904bbf1';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='19606ce2-5f7f-45fb-9bb5-f1761667d45f';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='b61d125c-864c-4179-bbfe-4416aef2b7e3';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='e6d90037-35e0-46b1-aea4-6d72a30bc53e';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='914cd27c-e032-4c1c-9810-10025d393ac4';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='32e83c61-4ffa-491b-97c4-db25e356911d';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='9869f9ee-591c-47c0-8467-d67acbf2b9b7';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='080f209a-64a5-4684-868b-33076a0ef66e';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='747becb7-14aa-4f07-9cd2-aedc941f26eb';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='2c7c25e1-f3ab-4a5c-ac01-57e4252281f3';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='0bc1ff78-123a-4535-8073-f884cba1732c';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='10fccc5e-d783-4ed4-afec-4014e2bc96b9';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='21a30a5d-eaee-4dca-b33e-e6421394c854';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='e505c6c6-536d-4b08-a126-b32250b4f696';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='61551eae-1a1a-4b6d-8fc7-49b4a7e79e12';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='e52c5f06-edad-496c-892f-ae4243959d19';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='89a34654-b788-434e-b4c4-a356c45a3ee4';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='8849f8ce-b578-42e3-8e05-df01cba518a0';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='fe807a9d-a566-472b-8c17-5724ee86d367';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='70e2708f-53bd-4b71-86d6-8d2dfe1256c3';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='c0a9dfe4-230f-42ee-bd9f-fcfc217262d6';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='eb2d4820-c528-4227-9bc8-9939f4acc1f2';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='45a2a194-2b82-47b4-8f4e-866d3ada9c7a';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='be7e761d-ba2e-4a8e-a24b-0fa6159edd27';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='bccf9b6c-d304-4190-be62-e34123028d46';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='a1b17a26-a232-4847-8ce7-176fd7885e75';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='9ba0ef64-4243-4c62-8fd2-c1b7faa37e86';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='1418b995-dc16-4765-b5c5-30588fba284b';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='040c9417-5275-474a-8e64-04ac1733976f';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='b1d4aaff-e4d8-4324-9acb-660cbcd0ee11';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='79d4b446-2aed-42da-a80b-cbe262b1a612';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='d30ed248-f3ef-4d6e-87c9-4128d123971d';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='3179ff24-3948-41e5-aa00-becfa7f92132';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='1b1258ba-94ca-4e36-8a31-93cef3535c6d';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='c5711e6c-b901-46fc-831f-8489f8690759';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='1a17c79b-d1f4-44e3-8c9f-b055664a904b';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='4544a95c-9901-4db7-91dd-fc7dbf5b7eb2';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='75b788ba-7405-4d44-904d-8d7e3766977c';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='eb6cf799-b1fe-4818-9dde-34c049446239';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='af8a0dae-be32-4fc5-8992-07a1bf85166b';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='744676d9-33f3-4ca1-8b66-282bf3aaf457';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='15c37a7a-7624-4de0-a5e8-e4318c544a01';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='c51c115f-2a85-457e-a920-4cb858dc46ec';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='85883322-2c4a-40a7-ab87-9fd82bd0e003';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='21dacde3-eccb-46b4-8dd2-0b3568917508';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='65e3f9bc-45dd-493a-9e6e-23c12ff369b3';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='ce7276a2-c090-419b-a9e8-06b82d97877b';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='67901bf8-e356-41a7-bed7-5258e5f53078';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='4b146ed5-a2a6-4f0a-a53a-4085e1561d92';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='23211e9d-944e-4189-9b2a-80517eddbdc7';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='161e5d07-5e4d-4f1a-b720-80388c8de48d';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='62e044dc-efcc-4e75-b789-f8ef5c6ccbc7';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='87cbf2e9-df62-4290-b022-154264557fb9';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='ba0655da-97c4-4bda-98a7-7f4f6eb35568';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='136b6e68-385b-4e24-a929-6c5d622c53e4';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='db740e04-dc13-4a4d-85fa-fb27bfacb9eb';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='b4c2dca3-53d7-4d7f-a0ab-e6261e6caeeb';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='d9d8940f-5e94-4a00-9240-03ec93ca3a7e';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='7dd751a5-f553-4ec9-ab3c-5e0c1e8d3f8f';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='62c7c09e-d8eb-47b1-9c82-2f1b9117ccaa';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='8ecb72d3-0d40-467b-9c0d-b0ae332f371e';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='3698ce8d-8edc-4128-a7c1-9570866a1e51';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='e1293dbb-14eb-48d5-af64-4d9f58ac68d0';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='cdf8ff8e-75bf-4396-bf6d-407f7db97ba1';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='535852fa-2b0e-49f7-913b-8740d0ce3536';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='75f6aca5-2212-45cf-af90-84c297eab1ef';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='bcff8e24-b54b-4e78-814e-de7fb8efaafb';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='af6cc00e-9923-46f3-95b6-385a65fe259a';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='938acdbb-0770-48a3-b859-ccf9077a2759';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='af0593ed-fbe6-4556-8028-347b9c32eb8c';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='4c8e59ed-780d-4821-8334-37823a609c8b';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='e557e48d-6fa7-4ba7-a020-d1fc698c5a7f';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='4c9d93ce-e705-484e-9c70-0d2ebbac1678';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='5231a28d-5dff-48e6-9d9c-61cc53a554ba';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='ed41ad6d-9422-4339-ab71-7ff225c7bc66';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='d1f5724e-59b0-44d0-8af5-fc7960fe3db0';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='46160b0e-54d4-4437-a900-722982872f98';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='11067f98-279a-4417-bcb5-2873bad2e04a';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='c0d46f08-b508-43fa-bf09-1f4d235f51b4';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='650e3c8f-9ded-45ba-ad42-4b6abb985634';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='5cf86c7d-ffc2-455e-850e-6a20bf3f0a83';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='65f61f84-8316-48f2-892e-b1e8b867de17';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='c7145546-aaf9-4a0c-9cbc-b364ef23ea29';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='72f4ba44-467c-49db-af1a-9e6ae2b68305';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='198ba02b-3838-4b0d-b4a3-89bc8ee10304';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='8cd9215b-6dfb-4ffb-b275-01b2275c2e82';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='53ed20e5-ae3c-46a7-ab69-3c857547875f';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='4edb7fff-9a3a-4f10-bfd2-e7871beb3b0a';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='79d2f310-9e24-42dd-a845-e9578605cc71';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='01367019-6a26-4239-8704-b1b372fafc37';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='ade47854-f453-4239-b2ce-e46eb6573cff';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='26d51781-5c58-44ff-b295-1f715b3afe4e';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='b52d9097-ac64-4067-9607-f1f6c3585164';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='8738c897-8263-421b-8449-98ea42bf7bc3';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='2d5b3383-cfc5-48cb-9c85-fddd72d1dc57';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='e3327bcc-90e4-4e8a-b6b9-b4c0c586261b';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='c2da8202-adf2-41e6-99ed-86a561c1e646';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='5d33a019-2ddd-41e9-aeab-7cfb91b06922';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='a0ae62ad-0e49-4693-88ff-98381e37cb11';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='6bbb8ed6-d70e-46c7-a3ef-5690ee21da8e';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='0b5cbebf-17fb-4a74-81d6-541dfc4e02c7';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='f13ac6ce-d416-4880-9288-a46b775b30da';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='e793af4b-c85b-43bb-bc5f-9d3cd92c23c5';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='bc199da9-bc51-46b3-a582-fe2a571c1220';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='53792db2-7695-4875-bad9-aaa4b8644371';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='044e20fa-9cba-440e-aa55-a672d7df48b8';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='c720e34b-5b70-4c2e-92ec-77f07e5978c5';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='3b86bbe6-500d-4b2c-b3ec-147877251f06';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='237241a4-c931-444f-b1ee-56ef889844b7';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='d4c0bf8b-6c75-4579-91a3-f76a242d83a4';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='17c3be80-6cd7-465f-b8f8-b929d002c0f0';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='e45e5538-d307-492f-8e35-2249cec0aaf1';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='0d1c8686-794b-4c44-96a3-d3069e3d0b0c';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='f24ab503-d6ba-48a9-9908-21fa27d889f4';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='9381b1b8-0840-4d27-938d-9c6d09056c76';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='8d0e6370-0b2e-48d9-bbfe-a83dd9847c0d';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='d1131b3d-2ad3-4e72-8911-775d516f9b49';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='30248c02-ca38-452f-b790-ccfd0f160b7f';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='6250ea1f-146a-4417-92f2-c2016e7afd1f';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='839b473d-9d21-45d2-a127-f2363aec27a8';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='f72720b8-b9e0-48d9-8145-fed35d2f9130';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='e04e9583-dff3-49f9-a88a-3fceeebb7020';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='c83e52a3-ba84-481e-92e9-0b3c113fcb94';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='27ad3f21-350d-415c-92ac-5219efbf0a9f';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='8773de2b-7cbd-4a8f-bf2d-36e2c9d4f6fb';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='29428cd8-39dd-4f4e-99f3-250ea1fd1a4a';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='14d90f79-7949-42ed-af03-b31e44f4c7a2';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='61d237c4-e24e-4b5e-827c-c88bd76a4a0a';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='2772d86f-3645-46ba-8f33-a81cb3353747';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='200052a1-b318-452d-b5aa-850765808ccc';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='f7bf4046-4c4a-442b-a593-b234cceeb84e';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='438a8a75-a756-4cf5-b7b9-bcfb8120c098';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='2446052e-7dd9-4810-9daa-0be0385dc5f3';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='3ceadb5a-33ef-4fd9-bdbf-a3fde6dbcb95';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='0c12d6ca-542e-4ae0-baa0-83171097e385';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='2315780e-955e-4d66-9b24-d98c3ebfa11c';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='d98d7e5c-1f8b-47c4-bc4b-5678f4514fc0';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='fd43a07a-963b-4475-931f-0c72b27ba1c7';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='f2e79d9b-a2a3-459d-9ed5-77bc4dabb2f0';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='60ca867f-8886-4bb7-8299-0829eec59bf2';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='38c70b5f-30d5-4bf7-8e7b-5b89f1deb379';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='a88beae9-4111-4982-b470-6ee3f5c57566';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='0ab692d2-bc86-4d93-a71c-6a270e7a71bc';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='ba1a6fde-3a4e-4822-98c9-dbf596918f18';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='3ac6efb4-df9a-4846-a278-6cfa085f981c';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='31d499be-342d-40fa-ad54-b627c595b8e0';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='2acd380e-4a71-407d-a861-c4bcaec25d7c';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='a23480db-2b22-4d1f-a0e8-2e6a2ff2f672';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='dcec7469-a2c4-4727-af57-33bd6def4449';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='8fdd5f8d-ff9e-4b12-a829-09da327b664b';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='755d7c93-7d77-4ba1-9ea6-e5c5dab27518';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='ea0c8532-ec6e-466e-b11c-e3a390aff432';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='363b3e05-017f-4b10-8f49-3b91d61f12dc';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='17c12000-3a83-4eb7-afff-80cb24dda374';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='ce35ad57-1e1a-4a10-a147-1ddfb654f318';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='a25db283-92ba-464b-820f-65799ae0270d';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='6a9b2859-1dfe-4771-b15c-f61660462efa';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='f9e71df2-0b3e-46d6-88d8-6e3f998680e1';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='e147d858-175a-4d65-be62-f8ee0bfe2622';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='6219ec27-d672-48a7-a3f5-1675afe66137';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='52a560f4-08ee-43ef-8f21-dd0e10c29c96';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='943c5531-3231-422f-99f0-31d4262d4961';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='f06c1dfb-217f-490e-880d-0aef3f977528';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='7f165269-63c3-41c0-a43f-4a089848edf6';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='91d591ce-0425-4ec1-ad82-35e91f8a04c9';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='105b3462-8d6d-4cbd-8cce-0e80e9aecc4a';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='7e2de0bb-fa79-424a-85aa-1942b3cf766c';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='963b4eb5-2c6b-4df0-9847-8f2d33581631';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='5a698d0d-2e84-4b73-aa14-26ea0e31b96e';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='b346dd06-f0e4-4ac9-a184-8bb3769fd369';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='6fc7d640-b955-414a-bee3-89ca1d11b57c';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='beecb6e1-86a1-4b2e-81d0-09e0e11e3a8a';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='bc845050-d9ed-4e22-a613-09d1283af43d';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='b86cc4a4-11b3-4dea-9b24-e69b359b5799';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='643cd381-48be-4c1f-9de2-948601982f88';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='c1b66a37-2077-4eb0-92f8-4013ed1cbd51';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='2d3c654a-39d0-4e35-b972-640a2b7f5cc6';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='23904376-07c2-4f87-a902-6a1f5c4407a9';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='1267452d-6314-46ff-b4fc-be553ab1d8c2';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='df1686b8-0261-49c8-8bb3-3da23aec9f2b';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='21100f0e-1905-4c0f-bac8-d397fbb43aea';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='9324bbeb-266c-4cb1-aab8-32b662b97e00';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='fb619087-cd49-413a-b9ef-5e99a32aeac4';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='8a787a7d-8663-4e19-8026-499d4ab64cee';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='0ae98c29-c569-4a72-ad95-31c9319c4fce';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='48d9d8e6-0aeb-47ba-ba30-57755c0b5a0b';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='3207fd76-76c0-43e4-a9ea-1753f2de778f';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='020834e5-5286-47b4-b1d1-5a1b04ef448b';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='e1e7c5f4-f1ee-4926-8655-6de8cf8566dc';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='8207c30e-5b02-4782-afc5-3d5cd3ff4acf';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='e956303e-d6cb-4be6-bfb9-a5d1789b5230';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='2f37dfa6-e946-4348-bcf0-96a28378ca47';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='3c2dc0a1-b3db-4bad-acbd-2004785cfcca';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='4970616b-c5d5-4b62-8f28-98519b333b50';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='ffe9c072-9ae4-4756-b511-73d73e59a2af';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='1e8b8082-0797-4c1b-8c29-8d4ffb1760b1';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='0112891c-5a2d-4e94-ae58-d78ec091e149';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='6c4bb915-4e17-484b-b243-91ce6ffa3903';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='e1fa607f-aea1-4c73-ab82-d2261c9eb37e';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='2e251baf-7bab-48c1-aa15-7f15f2666928';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='a0624ee4-4b55-4036-9534-662057063774';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='e632f6df-139a-493b-8dfe-079bb8884572';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='78aaa533-9b6d-4ecd-8401-02657d15a50e';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='e11bbe05-c653-49e8-8145-1da7626dcd8b';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='36adbfe4-c17e-45f5-aaa0-01e1f80562df';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='d03fc9af-525c-48d7-8076-9c847a341a8b';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='9735bfe1-45d4-40f3-b6d1-de5611e36dac';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='9091043b-c16c-4b01-9cd7-e43bb708c9dc';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='e2f95806-473b-40c1-9867-4fa8e804a5a5';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='06b08feb-4429-4378-bc45-10f963076be7';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='7d6f9744-08e4-4027-a20e-c708b5ded233';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='73374b16-7f13-475b-817d-2bb4bb3bd980';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='3bd51f1d-d499-42fb-87b2-401d49111e45';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='1ad286ff-cb73-4ca5-9e57-510d67577ba6';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='9b364971-64fe-4336-8e2a-281111d51999';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='60da1922-615c-45d7-a07f-80dd6a39f741';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='80ac9f1c-34d5-4e8c-9d7a-b21fe652cab5';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='476db734-6e0b-42bf-9b61-a1e430d4fd4f';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='39b2aa80-da4b-420f-8ac0-9c31a49f64e1';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='33d72a5e-ab08-45b9-8c52-616ddb649e60';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='7080c10e-ed79-4d5a-a8bc-2fc2f33fcf2f';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='f9eafa41-299c-4e32-9139-ee707a77e37e';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='b4e569de-1972-4463-8096-9a908d428f36';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='80b5efca-a159-4453-a041-2db4b186f551';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='90bde985-dd13-411f-896f-de9c42aa2b9e';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='d2562c06-530d-4ed3-b8e2-bb1a407c14f3';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='d31b38cb-8dee-4fa1-b96c-e961dc555bfb';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='31299833-cf8d-48d0-8ba7-52fe1f2eb67c';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='f21bc89c-95d8-40cc-b610-0a24fba411f6';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='bcb849c0-3995-44ea-af74-7426850f1a24';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='d1367bf5-9256-49ac-bd37-8073ffeaf723';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='af8ea85b-2ccb-4305-b312-8a8a940f04e9';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='7a5e6d57-73a1-4f3b-bdb8-ff0380d9ca97';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='79e931de-403e-4209-8e41-fbd4b607976f';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='da7640f0-db58-4098-a04a-0c937ea64e3c';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='65252098-7257-4a84-b0ad-72b421c04249';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='d5f9d7b9-7065-4084-a01e-468f7f6c5290';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='d229d191-6463-4e17-93f9-60823b98dd23';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='44c24363-7cbd-44e3-be08-12c5cc9ba955';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='88816e98-9ce5-41ef-899f-921bbde9ec1f';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='6f1268df-6b3b-4bca-a256-eae2b0e4eadd';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='4ed05812-8f62-4c0c-8ebe-30c7c4424538';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='cb27c59d-b5ce-45b2-81d1-e7868a01b170';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='710e8485-d992-4307-83df-7505765f863c';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='9555eaf7-9547-4e48-a6a8-a6d23fb22a89';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='217a45a7-53a5-46bc-8d16-070075c28d0d';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='f3de47c0-a1a1-4b0a-9892-5a4b23f29efe';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='4931234a-956b-41b8-bdb1-a92d8f521495';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='d5d290e3-2db8-4c34-aeec-ab7f1b5adf6c';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='dcedbc99-1ddc-41aa-a38c-1670bfc94bc1';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='8301168a-bbec-4c0e-a54e-581997ccbcfb';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='e8e1fdb5-5d53-4e79-b4cc-c9fd0c5caf6f';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='67a4fca9-eb03-4bca-9d92-7b7a4956245b';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='c425d88b-b404-45d1-b337-069100c4b3c9';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='63ac2ae9-ac50-4771-884c-7a3e772630b5';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='3cc0db13-f823-488e-9601-d5bced30a77b';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='69c1e31f-5052-49d2-9bc6-4f2fa8a36f80';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='6d00cf9c-92c0-49ca-b069-9bc1c0348869';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='e4848cf1-3595-4cc9-b72f-b89bbd9972eb';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='799c87a3-a7c7-46e9-91d0-387203e4337e';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='32ceb3b6-1764-4bfe-8190-815aef25b0d0';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='aea52558-f580-4210-95c0-6156ce75a8de';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='fed8af5c-9eb3-4f8b-b58b-9052e82dedcc';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='6fc02cf1-dc27-4099-9799-fd460b929311';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='bfd0c687-2351-4c7a-8cc3-5a2c593c9b5a';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='8802f39a-5d21-4d9a-858d-bc60dd6e0fc3';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='e24c5525-f447-452e-9c9f-dcd16b62f6a9';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='127456b9-bca5-467e-ba2a-eafcfd8448dc';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='68ce2bcf-becf-4388-8fca-aca87aabf409';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='31c386df-3c2a-434a-bac2-b4735c6e6ad7';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='a97b8ab3-bd84-4e52-bef5-fb95bb8b621a';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='d3d1eb2b-b0b6-43ad-81f7-1aeacf21c3a2';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='4baa1b4b-6e14-4cca-aec9-7507c836cd2d';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='a72581cd-1a75-400b-aeea-75cd30316370';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='5178ffce-a1b3-4f3e-a21f-c471f36da53f';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='b99bfcf0-215a-468a-b40f-1853ac57650e';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='5e60ba45-33c2-4d38-b700-b6e1aa1410f5';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='04d2e54f-9ca5-4a5c-8d89-f4e40d9e42f6';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='8f7259d5-17b0-414c-aad8-dafb7a85dee3';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='c193bfac-102d-4a6f-8baf-65026f8e488d';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='ae7805f9-e6e2-4587-b089-1ec1e22c199a';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='1e00cd2d-ab34-4a7c-9580-44dea0e98ab5';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='96afd020-84ed-46c8-be0d-e44b0ec47b83';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='7b39dc99-6c4b-4db5-87ee-c3e6022f805c';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='fe285011-3ea1-4f4a-930d-bcf48c9dbb91';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='3f17041b-aeea-4bce-a1ba-e720e7805657';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='ab34b809-c901-437d-ad0b-32b0ab3d58c7';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='04768139-496d-4e26-bf82-e17b8f653a36';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='9d85b945-0e9e-4e64-9131-d74f0b32a307';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='0cc186c6-f182-4426-b447-11cce11df563';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='eec9fa87-e382-4a72-97dd-741e0e929701';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='a009439b-bc80-4688-a600-745eac76d594';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='dd1d1633-51cc-407e-9bd3-d07039efa4c2';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='fcbd4911-9bf9-4e77-95d6-9db61f579f89';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='afb274ba-5044-4fb9-acf6-afef52b19d53';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='f1e17893-747c-4ee5-b9aa-79840f0f544f';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='bad5a5ad-f6c5-41e2-b770-b0f99c6ba9bd';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='5b21f93d-c867-4fb8-89ff-666aca6417a4';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='f1560e51-0e7f-49c4-921c-14e4e995aad4';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='007e5a75-e222-4e69-824f-4a94f3a93f28';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='48458589-acab-4d68-a1f4-f5a5e3e31d18';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='ae3eba04-18df-4380-a32d-8c2f80665e76';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='bdea7906-b4c5-4df5-bca1-6fc3636dc271';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='65dce713-4819-4af3-bed6-6991166732bb';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='258c4030-d7f1-4ba4-bacb-8ae54c2f98a9';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='1ede2a66-64cb-4d49-86b6-d4f1ea7000df';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='9dac5991-48b8-40da-8773-4c42300b087c';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='cf2dadda-db09-4797-b914-caed11d854c6';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='5a12f777-d44c-4c52-8361-1c2b5e77835b';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='9ab75599-abd3-41e5-8688-e9063ffd7900';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='161ddb22-b92f-41b1-8547-622d5f7f640a';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='f2ebf5c1-7b9e-4e65-aa60-1978bb441211';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='333ae4b0-c229-4721-ae5f-5579dc2e78db';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='b017542f-1d74-4fa9-b3ed-86531eae677e';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='37c8dfaf-25b6-4f50-af5a-e19b4805b948';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='deca1e0f-23e7-4870-9002-fa00f94c6077';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='c7ffa343-5595-49e2-86f5-46432380d2b4';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='fa9624da-6e8b-4a84-a91e-5b8070c19d30';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='a3b97043-959e-48a8-84c9-9104468cc8e3';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='d720447c-62db-41b7-89ac-25ee9364977f';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='df45c964-6369-472a-bfbe-75ac6cb71582';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='f451b4bb-f5dd-4ec4-bc69-2f8ca4953603';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='7801068c-2117-481e-88a9-ee698e936d77';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;
$DeviceId='343fa4f6-318e-41f4-a163-06ec20668259';$DeviceCategory = '5be9ce0c-9e60-448c-bd87-393975523276';Change-DeviceCategory -DeviceID $DeviceID -DeviceCategory $DeviceCategory;