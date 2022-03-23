# Cloud Init Configuration

1. Add Microsoft Repositories. 
   - MS repo for Centos 7
   - MS repo for RHEL 7
2. Update all packages.
3. Upgrade all packages.
4. Install the following packages:
   - [Python 3](https://www.python.org/)
   - [OMI](https://github.com/microsoft/omi)
   - [Powershell 7](https://docs.microsoft.com/en-us/powershell/scripting/install/install-centos?view=powershell-7.2)
   - Tree 
5. Configure & mount hard disks.
   - **/mnt/resource** - mount swap and ephemeral hard disk. 
   - **/mnt/data** - mount data hard disk 256GB for rsyslog files.
6. Create Directories & links:
   - **/mnt/data/rsyslog**.
   - **/mnt/data/mnt/data/rsyslog/archives**.
   - soft link **FROM** /var/log/rsyslog **TO** /mnt/data/rsyslog/. 
7. Update powershell modules.
8. Disable SELinux.
9. Replace rsyslog file with the desired configuration (create relevant log files according to client's IP).
10. Create Log Rotate file for the files created in rsyslog and set the rules for rotating the files.
11. Create Log Rotate files for forwarding log files to the docker image.
12. Prepare crontab file that will rotate the logs every 15 minutes.
13. Configure crontab file
14. Install Powershell Modules:
    - Az
    - GuestConfiguration
    - PackageManagement
    - PowerShellGet
    - PSDscResources
    - PSDesiredStateConfiguration
    - nx
15. Register machine on automation account. 