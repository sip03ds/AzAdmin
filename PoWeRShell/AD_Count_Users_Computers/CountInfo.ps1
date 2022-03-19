# Count Computers
Get-ADComputer -Filter "name -like '*'" -Properties operatingSystem | group -Property operatingSystem | Select Name,Count | Sort Name | ft -AutoSize

# Count Computers per OU
Get-ADComputer -SearchBase "OU=TestOU,DC=TestDomain,DC=Local"`
-Filter 'OperatingSystem -like "*Windows Server 2008 R2*"' -Properties * |
 Select -Property Name,operatingSystem,@{Name="LastLogon";
Expression={[DateTime]::FromFileTime($_.lastLogon).ToString()}} |
# Export AD Computers to CSV file 
Export-CSV "C:\ADComputers.csv" -NoTypeInformation -Encoding UTF8

# count Users 
(Get-ADUser -Filter *).Count
# count Groups 
(Get-ADGroup -Filter *).Count
# count Computers 
(Get-ADComputer -Filter *).Count

Get-ADUser -SearchBase "OU=Steelmet Adm,OU=Vionet,DC=corp,DC=vionet,DC=gr"` -Filter * -Properties * | group -Property extensionAttribute15 | Select Name,Count | Sort extensionAttribute15 | ft -Autosize

Get-ADUser -Filter * -Properties * | group -Property extensionAttribute15 | Select Name,Count | Sort extensionAttribute15 | ft -Autosize