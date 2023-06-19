
ForEach ($Service in $Services) {Get-Service $Service | Select-Object Name, Status}


DCDiag /Test:DNS /e /v

Get-WinEvent -FilterHashtable @{
                LogName = 'Security'
                    ID = 2889
                }


Invoke-Command -ComputerName  10.25.80.11 -ScriptBlock { DCDiag /Test:DNS /e /v } -credential VIONET\t0_distathopoulos


