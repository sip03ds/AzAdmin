$computers= get-content .\computers.txt 
foreach ($computer in $computers) {
	$vmhost = Invoke-Command -ComputerName $computer -ScriptBlock { (get-item "HKLM:\SOFTWARE\Microsoft\Virtual Machine\Guest\Parameters").GetValue("HostName") }
	Write-Output "VM: $computer ; Host: $vmhost";
}