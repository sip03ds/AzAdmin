Configuration ControlledFolderAccess {
    param (
	)
	Import-DscResource -ModuleName PSDesiredStateConfiguration;

    Node localhost {
        Registry EnableControlledFolderAccess {
			Ensure = "Present";	
			Key = "HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Controlled Folder Access";
			ValueName = "EnableControlledFolderAccess";
			ValueData = "1";
			ValueType = "Dword"; 
		}   
    }
}