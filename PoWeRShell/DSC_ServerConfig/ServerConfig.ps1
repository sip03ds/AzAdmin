Configuration ServerConfig
{

	param (
		[string[]]$NodeName = 'localhost'
	)
	Import-DscResource -ModuleName GPRegistryPolicyDsc;
	Import-DscResource -ModuleName PSDesiredStateConfiguration;	
	
	
	Node $NodeName {
		# Configuration to disable SMBv1 
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
		
		# Configuration to enable expanded taskbar (GUI only) 
		Registry ExpandTaskBarUser {
			Ensure = "Present";	
			Key = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer";
			ValueName = "NoAutoTrayNotify";
			ValueData = "1";
			ValueType = "Dword";
		}
		Registry ShowAllIconsInNotificationAreaUser {
			Ensure = "Present";	
			Key = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer";
			ValueName = "EnableAutoTray";
			ValueData = "0";
			ValueType = "Dword"; 
		}
		Registry ExpandTaskBarMachine {
			Ensure = "Present";	
			Key = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer";
			ValueName = "NoAutoTrayNotify";
			ValueData = "1";
			ValueType = "Dword"; 
		}
		
		# Set small icons on taskbar
		Registry SmallIconsTaskbarUser {
			Ensure = "Present";	
			Key = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced";
			ValueName = "TaskbarSmallIcons";
			ValueData = "1";
			ValueType = "Dword"; 
		}
	}
}

ServerConfig -output C:\DSC\
Start-DSCConfiguration -Path C:\DSC\ -Wait -Force -Verbose