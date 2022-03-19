Configuration DisableSmbv1
{	
	param
	(
	)
    Import-DscResource -ModuleName GPRegistryPolicyDsc

    Node localhost
    {
        RegistryPolicyFile TurnOffSmb1
        {
			Ensure 	   = "Present";	
            Key        = 'HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters'
            TargetType = 'ComputerConfiguration'
            ValueName  = 'SMB1'
            ValueData  = 0
            ValueType  = 'DWORD'
        }

        RefreshRegistryPolicy RefreashPolicyAfterSMB1
        {
            IsSingleInstance = 'Yes'
            DependsOn        = '[RegistryPolicyFile]TurnOffSmb1'
        }
    }
}