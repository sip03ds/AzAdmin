Configuration DisableNetBios
{
    Import-DscResource -ModuleName NetworkingDsc

    Node localhost
    {
        NetBios DisableNetBios
        {
            InterfaceAlias = 'Ethernet'
            Setting        = 'Disable'
        }
    }
}