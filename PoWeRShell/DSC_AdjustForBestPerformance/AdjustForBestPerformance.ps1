Configuration AdjustForBestPerformance {
	param (
	)
	Import-DscResource -ModuleName PSDesiredStateConfiguration;
	
	Node localhost {
		Registry VisualFXSettingUser {
			Ensure = "Present";	
			Key = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects";
			ValueName = "VisualFXSetting";
			ValueData = "2";
			ValueType = "Dword"; 
		}
		Registry MinAnimateUser {
			Ensure = "Present";	
			Key = "HKCU:\Control Panel\Desktop\WindowMetrics";
			ValueName = "MinAnimate";
			ValueData = "0";
			ValueType = "String"; 
		}
		Registry TaskbarAnimationsUser {
			Ensure = "Present";	
			Key = "HKCU:\Control Panel\Desktop\WindowMetrics";
			ValueName = "TaskbarAnimations";
			ValueData = "0";
			ValueType = "String"; 
		}
		Registry TaskbarAnimationsMachine {
			Ensure = "Present";	
			Key = "HKLM:\Control Panel\Desktop\WindowMetrics";
			ValueName = "TaskbarAnimations";
			ValueData = "0";
			ValueType = "String"; 
		}
		Registry CompositionPolicyUser {
			Ensure = "Present";	
			Key = "HKLM:\Control Panel\Desktop\WindowMetrics";
			ValueName = "CompositionPolicy";
			ValueData = "0";
			ValueType = "String"; 
		}
		Registry ColorizationOpaqueBlendUser {
			Ensure = "Present";	
			Key = "HKLM:\Control Panel\Desktop\WindowMetrics";
			ValueName = "ColorizationOpaqueBlend";
			ValueData = "0";
			ValueType = "String"; 
		}
		Registry AlwaysHibernateThumbnailsUser {
			Ensure = "Present";	
			Key = "HKCU:\Software\Microsoft\Windows\DWM";
			ValueName = "AlwaysHibernateThumbnails";
			ValueData = "0";
			ValueType = "Dword"; 
		}
		Registry DisableThumbnailsUser {
			Ensure = "Present";	
			Key = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer";
			ValueName = "DisableThumbnails";
			ValueData = "1";
			ValueType = "Dword"; 
		}
		Registry ListviewAlphaSelectUser {
			Ensure = "Present";	
			Key = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced";
			ValueName = "ListviewAlphaSelect";
			ValueData = "0";
			ValueType = "String"; 
		}
		Registry DragFullWindowsUser {
			Ensure = "Present";	
			Key = "HKCU:\Control Panel\Desktop";
			ValueName = "DragFullWindows";
			ValueData = "0";
			ValueType = "String"; 
		}
		Registry FontSmoothingUser {
			Ensure = "Present";	
			Key = "HKCU:\Control Panel\Desktop";
			ValueName = "FontSmoothing";
			ValueData = "0";
			ValueType = "String"; 
		}
		Registry ListviewShadowUser {
			Ensure = "Present";	
			Key = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced";
			ValueName = "ListviewShadow";
			ValueData = "0";
			ValueType = "String"; 
		}
		Registry ThemeActiveUser {
			Ensure = "Present";	
			Key = "HKCU:\Software\Microsoft\Windows\CurrentVersion\ThemeManager";
			ValueName = "ThemeActive";
			ValueData = "0";
			ValueType = "String"; 
		}
		Registry ThemeActiveMachine {
			Ensure = "Present";	
			Key = "HKLM:\Software\Microsoft\Windows\CurrentVersion\ThemeManager";
			ValueName = "ThemeActive";
			ValueData = "0";
			ValueType = "String"; 
		}
		Registry UserPreferencesMaskUser {
			Ensure = "Present";	
			Key = "HKCU:\Control Panel\Desktop";
			ValueName = "UserPreferencesMask";
			Hex = $true
			ValueData = "9012018010000000";
			ValueType = "Dword"; 
		}
	}
}