# NECESSARY MODULES
# $Env:PSModulePath -split ';'
# 
# Find-Module              --> Finds modules in a repository that match specified criteria.
# Get-Module               --> List the modules imported in the current session or that can be imported from the PSModulePath.
# Get-InstalledModule      --> Gets a list of modules on the computer that were installed by PowerShellGet.
# Install-Module           --> Downloads one or more modules from a repository, and installs them on the local computer.
# Install-Script           --> Installs a script.
# 
# Get-DSCResource          --> Gets Desired State Configuration (DSC) resources present on the computer. - Get-DSCResource -Name TimeZone -Syntax
# Find-DscResource         --> Finds Desired State Configuration (DSC) resources. - Find-DSCResource | Where-Object {$_.Name -like "Time*"}
# Update-DscConfiguration  --> Updates DSC configuration 
# 
# Set-DscLocalConfigurationManager C:\DSC\DscMetaConfigs\ --> configures DSC based on MOF provided 
# Get-DscLocalConfigurationManager --> provides DSC configuration
# 
# Install-PackageProvider -Name NuGet -Force
# Install-Module -Name PowerShellGet -Force
# Install-Script -Name Troubleshoot-WindowsUpdateAgentRegistration -Force
# Install-Module -Name ??
# Install-Module ComputerManagementDsc -Force
# Install-Module NetworkingDsc -Force
# 

Configuration CommonServerConfig {
	param (	
	)
    # Import the module that contains the File resource.
    Import-DscResource -ModuleName PsDesiredStateConfiguration
	Import-DscResource -ModuleName ComputerManagementDsc
    # The Node statement specifies which targets to compile MOF files for, when
    # this configuration is executed.
    Node 'localhost' {
        # The File resource can ensure the state of files, or copy them from a
        # source to a destination with persistent updates.
        File HelloWorld {
            DestinationPath = "C:\Temp\HelloWorld.txt"
            Ensure = "Present"
            Contents   = "Hello World from DSC!"
        }
		# ADJUST FOR BEST PERFORMANCE CONFIGURATION
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
    }
}
CommonServerConfig -OutputPath 'C:\DSC'
#Start-DscConfiguration -Path .\CommonServerConfig -Wait -Verbose -Force