Import-Module ActiveDirectory

#Search for the users and export report

get-aduser -filter * -properties Name, PasswordNeverExpires,samAccountName | where { $_.passwordNeverExpires -eq "true" } |  Select-Object DistinguishedName,Name,Enabled,samAccountName | Export-csv -Encoding UTF8 C:\Users\t0_distathopoulos\Desktop\pw_never_expires.csv -NoTypeInformation