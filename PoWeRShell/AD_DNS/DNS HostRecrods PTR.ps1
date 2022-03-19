﻿#Script to add DNS 'A' Records 'PTR' Records to DNS Servers
$dns = "dc3stlmrs.corp.vionet.gr" # Your DNS Server Name
$Zone = "vionet.gr" # Your Forward Lookup Zone Name
$ReverseZone = "10.in-addr.arpa" # Your ReverseLookup Zone Name Goes Here
$a = import-csv C:\Users\distathopoulosadmin\Desktop\DNS.csv

#Preparing the C:\Reverse.csv from C:\DNS.CSV for Adding PTR Records
$b = $a | Select-Object -expand IP
$c = $b | %{$_.Split(".") | Select-Object -Index 3}
$d = $a | Select-Object -Expand Name
$e = $d | %{$_.Insert($_.length,".ad.com")}
for($i=0;$i -le ($e.Length);$i++)
{
('"{0}","{1}"' -f $c[$i],$e[$i]) | Out-File C:\Reverse.csv -Append -Encoding ascii
}

$header = "IP","Name"
$f = Import-Csv C:\Users\distathopoulosadmin\Desktop\Reverse.csv  -Header $header

#Adding 'A' Record to DNS Forward Lookup Zone
$a | %{dnscmd $dns /recordadd $Zone $($_.Name)A $($_.IP)}

#Adding 'PTR' Record to DNS Reverse Lookup Zone
$f | %{dnscmd $dns /recordadd $ReverseZone $($_.IP)PTR $($_.Name)}