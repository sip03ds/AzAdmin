# W2016 key does not exist ! 
# W2019 key does not exist !
# W2012R2 key does not exist !
# W2008R2 key does not exist !
Configuration SetTaskBarExpanded {
	param (
	)
	Import-DscResource -ModuleName PSDesiredStateConfiguration;
	
	Node localhost {
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
	}
}