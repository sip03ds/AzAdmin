$step=$args[0]

if ($args.length -eq 1)
{
  $serverList=$args[0]
  if ( $serverList -eq "ServerList.txt" )
  {
	  if ( Test-Path  $serverList -PathType Leaf ) 
	  {
		if ( Test-Path .\DiskUsageReport.csv -PathType Leaf ) 
		{
	    		Write-Host "Removing Existing Disk Usage Report DiskUsageReport.csv";
			Remove-Item -Path DiskUsageReport.csv
		}
		Add-Content -Path .\DiskUsageReport.csv -Value '"Computer","Drive","Total Available Space (GByte)","Total Used Space (GByte)","Total Free Space (GByte)"';
	  	foreach($line in Get-Content $serverList) 
		{
			$testConnection = Test-Connection $line
			if ($testConnection -ne "") 
			{
				if ($testconnection -ne $null) 
				{
					$drives=Get-WmiObject Win32_LogicalDisk -ComputerName $line;
                                        foreach ($drive in $drives)
					{
						$drivename=$drive.DeviceID;
						$freespace=($drive.FreeSpace/1GB);
						$totalspace=($drive.Size/1GB);
						$usedspace=$totalspace - $freespace;
						Add-Content -Path  .\DiskUsageReport.csv -Value "$line,$drivename,$totalspace,$usedspace,$freespace"
						$output="Computer: "+$line+ " Drive: "+$drivename+ " Total Space: "+$totalspace+" Used Space: "+$usedspace+ " Free Space: "+$freespace
					}
				}
			} 
		}	
	  }
	  else 
	  {
	    Write-Host "Please pass a ServerList.txt file as parameter";
	    Write-Host "Each line of txt file should contain a valid reacheable server name to report";
	  }
  }
  else 
  {
	Write-Host "The file should be named ServerList.txt";
  }
}
else 
{
  Write-Host "Please pass a ServerList.txt file as parameter";
  Write-Host "Each line of txt file should contain a valid reacheable server name to report";
}