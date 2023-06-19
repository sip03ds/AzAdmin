Configuration LinuxConfig
{
    Import-DscResource -ModuleName 'nx'

    Node IsPresent
    {
        nxPackage rsyslog
        {
            Name              = 'rsyslog'
            Ensure            = 'Present'
            PackageManager    = 'Yum'
        }
    }

    Node IsNotPresent
    {
        nxPackage rsyslog
        {
            Name              = 'rsyslog'
            Ensure            = 'Absent'
        }
    }
}