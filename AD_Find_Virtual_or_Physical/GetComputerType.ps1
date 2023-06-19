$computers= get-content .\computers.txt 
foreach ($computer in $computers) {
	systeminfo /s $computer | findstr /c:"Model:" /c:"Host Name" /c:"OS Name" | out-file -FilePath .\VirPhys.txt -append 
}