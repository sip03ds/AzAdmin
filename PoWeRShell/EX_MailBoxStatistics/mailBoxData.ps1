$mailBoxes = @()
#$allMailBoxes = Get-MailBox -resultSize 100
$allMailBoxes = Get-MailBox -resultSize unlimited

$mailBoxesAndDevices = @()

foreach ($mailBox in $allMailBoxes) { 
	$name = $mailBox.Name;
	$alias = $mailBox.Alias;
	$statistic = Get-ActiveSyncDeviceStatistics -Mailbox $mailBox | select DeviceFriendlyName,DeviceModel,DeviceOS
	$devices = $statistic.DeviceFriendlyName
	$deviceOSes = $statistic.DeviceOS
	<#
	foreach ($device in $devices) {
		$entry = "$alias;$device"
		$mailBoxesAndDevices += $entry;
	}
	#>
	foreach ($deviceOS in $deviceOSes) {
		$entry = "$alias;$deviceOS"
		$mailBoxesAndDevices += $entry;
	}
}
$mailBoxesAndDevices
$allMailBoxes.count
$mailBoxesAndDevices 