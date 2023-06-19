net stop wuauserv 
net stop cryptSvc 
net stop bits 
net stop msiserver 

del /f "%ALLUSERSPROFILE%\Application Data\Microsoft\Network\Downloader\qmgr*.dat" 
del /f %SystemRoot%\SoftwareDistribution\*.*  
del /f %SystemRoot%\system32\catroot2\*.* 
del /f %SystemRoot%\WindowsUpdate.log

net start wuauserv 
net start cryptSvc 
net start bits 
net start msiserver