# The script finds if the appropriate AD attributes used by SPSS are populated on AD
# On Premise AD Attribute        Azure AD Attribute
#
# telephoneNumber                Office Phone
# mobile                         Mobile Phone
#
#
$logPath = "C:\Scripts"
$ExecutionlogFileName = "$date-PasswordExecutionLog.txt"
$ExecutionLogFile = $logPath, $ExecutionlogFileName -join "\"

$users = Get-ADUser -filter {(Enabled -eq $true)} -properties Name, EmailAddress, telephoneNumber, mobile
$usersCount = ($users | Measure-Object).Count

foreach ($user in $users)
{
	$Name = $user.Name
    $emailaddress = $user.emailaddress
    $telephoneNumber = $user.telephoneNumber
    $mobile = $user.mobile
	if (($emailaddress) -eq $null)
	{
		Add-Content $ExecutionLogFile "name: $user.Name "
		Add-Content $ExecutionLogFile "No EMAIL "
	}
	if (($telephoneNumber) -eq $null)
	{
		Add-Content $ExecutionLogFile "No TELEPHONE "
	}
	if (($mobile) -eq $null)
	{
		Add-Content $ExecutionLogFile "No MOBILE "
	}
	Add-Content $ExecutionLogFile " "
}