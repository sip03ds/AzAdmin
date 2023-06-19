$usersInFgpp = @()
$groupNames= Get-ADFineGrainedPasswordPolicySubject -Identity End_Users | Select-Object -Property $_.Name
foreach ($groupName in $groupNames) {  
    $group=Get-ADGroup -Identity $groupName
    $usersInGroup=Get-ADGroupMember $group -Recursive
    foreach ($user in $usersInGroup) {
        $usersInFgpp += $user
    }
}
$uniqueUsersInFgpp = $usersInFgpp | Get-Unique
$usersInFgppCount=$usersInFgpp.count
$uniqueUsersInFgppCount=$uniqueUsersInFgpp.count

$usersInFgppWithPasswordExpiration = @()
foreach ($user in $uniqueUsersInFgpp) {
    $userWithProperties = Get-ADUser -Identity $user.SamAccountName -Properties Name,samAccountName,Company,PasswordNeverExpires,extensionAttribute15,adminDisplayName
    $userPasswordExpires=$userWithProperties.PasswordNeverExpires
    if ($userPasswordExpires -eq $false) { 
		$usersInFgppWithPasswordExpiration += $userWithProperties 
	}  
} 
$usersInFgppWithPasswordExpirationCount=$usersInFgppWithPasswordExpiration.count

Write-Host "All FGPP users are: $usersInFgppCount"
Write-Host "All FGPP unique users are: $uniqueUsersInFgppCount"
Write-Host "All FGPP unique without password never expires are: $usersInFgppWithPasswordExpirationCount"

