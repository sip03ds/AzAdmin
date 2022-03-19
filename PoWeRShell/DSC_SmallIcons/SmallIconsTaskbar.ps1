# W2016 key does not exist ! 
# W2019 key does not exist !
# W2012R2 key does not exist !
# W2008R2 key does not exist !
Configuration SetSmallIconsTaskbar {
	param (
	)
	Import-DscResource -ModuleName PSDesiredStateConfiguration;
	
	Node localhost {
		Registry SmallIconsTaskbarUser {
			Ensure = "Present";	
			Key = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced";
			ValueName = "TaskbarSmallIcons";
			ValueData = "1";
			ValueType = "Dword"; 
		}
	}
}