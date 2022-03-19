Get-ADUser -Filter 'enabled -eq "true"' -SearchBase "OU=Steelmet Adm,OU=Vionet,DC=corp,DC=vionet,DC=gr" -Properties name,samAccountName,adminDisplayName,extensionAttribute15,extensionAttribute14,extensionAttribute6,mobile,mail |  Select-Object name,samAccountName,adminDisplayName,extensionAttribute15,extensionAttribute14,extensionAttribute6,mobile,mail | Export-csv -Encoding UTF8 C:\Users\t0_distathopoulos\Desktop\users_mail.csv -NoTypeInformation

# {(badpwdcount -eq '0') -and (enabled -eq 'true')}

# Users without Security License
Get-ADUser -Filter {(enabled -eq "true") -and (extensionAttribute15 -eq "physical") -and (department -like "Information Technology Dpt")} -SearchBase "OU=Anamet_Adm,OU=Vionet,DC=corp,DC=vionet,DC=gr" -Properties name,samAccountName,adminDisplayName,extensionAttribute15,extensionAttribute14,extensionAttribute6,mobile,mail |  Select-Object name,samAccountName,adminDisplayName,extensionAttribute15,extensionAttribute14,extensionAttribute6,mobile,mail | Export-csv -Encoding UTF8 C:\Users\t0_distathopoulos\Desktop\users_nosec.csv -NoTypeInformation


Get-ADUser -Filter * -SearchBase "OU=Vionet,DC=corp,DC=vionet,DC=gr" -Properties name,samAccountName,adminDisplayName,extensionAttribute15,extensionAttribute14,extensionAttribute6,mobile,mail |  Select-Object name,samAccountName,adminDisplayName,extensionAttribute15,extensionAttribute14,extensionAttribute6,mobile,mail | Export-csv -Encoding UTF8 C:\Users\t0_distathopoulos\Desktop\users_mail.csv -NoTypeInformation


Get-ADUser -Filter '{-not(adminDisplayName -like "*") }' -SearchBase "OU=Vionet,DC=corp,DC=vionet,DC=gr" -Properties name,samAccountName,adminDisplayName,extensionAttribute15,extensionAttribute14,extensionAttribute6,mobile,mail |  Select-Object name,samAccountName,adminDisplayName,extensionAttribute15,extensionAttribute14,extensionAttribute6,mobile,mail | Export-csv -Encoding UTF8 C:\Users\t0_distathopoulos\Desktop\users_mail.csv -NoTypeInformation