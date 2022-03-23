# DSC Configuration for Automation Account

[Rsyslog.ps1](https://github.com/sip03ds/AzAdmin/blob/original/RSyslog_Sentinel/dsc/Rsyslog.ps1)

1. Use nx module. 
2. Create a function that will handle EOF on Linux
3. Create file contents for:
   - rsyslog.conf
   - rsyslog logrotate file
   - f5 logrotate file
   - checkpoint logrotate file 
   - darktrace logrotate file
   - fortigate logrotate file
   - crontab test script
   - microsoft RHEL repository
   - microsoft CENTOS repository 
4. Install the following packages:
   - [Python 3](https://www.python.org/)
   - [OMI](https://github.com/microsoft/omi)
   - [Powershell 7](https://docs.microsoft.com/en-us/powershell/scripting/install/install-centos?view=powershell-7.2)
   - Tree
   - wget
   - DSC
5. Ensure that all files with the contents created are created on the right path
6. Ensure that [rsyslog](https://www.rsyslog.com) daemon is running