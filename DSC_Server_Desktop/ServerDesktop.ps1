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

Configuration ServerDesktop {
	param (	
	)
    # Import the module that contains the File resource.
    Import-DscResource -ModuleName PsDesiredStateConfiguration
	Import-DscResource -ModuleName ComputerManagementDsc
    Import-DscResource -ModuleName rsBGInfo
    Import-DscResource -ModuleName GPRegistryPolicyDsc
    Import-DscResource -ModuleName NetworkingDsc
    Import-Module Orchestrator.AssetManagement.Cmdlets

    #$credential=Get-AutomationPSCredential -Name 't1_test' 
    # The Node statement specifies which targets to compile MOF files for, when
    # this configuration is executed.
    Node 'localhost' {
        # ~~~~~~~~~~~~~~~~~~~ BACKGROUND ~~~~~~~~~~~~~~~~~~~ 
        # The File resource can ensure the state of files, or copy them from a
        # source to a destination with persistent updates.
        File Viohalco_Config {
            DestinationPath = "C:\Viohalco_Config"
            Ensure = "Present"
            Type = "Directory"
        }
        # Downlaod the server background
        Script GetImageBackGround {
            SetScript = { Invoke-WebRequest -Uri "https://stweuinfpsta001.blob.core.windows.net/endpoint/logos/Server_Background_File.jpg?sp=r&st=2022-01-27T12:31:10Z&se=2025-01-27T20:31:10Z&spr=https&sv=2020-08-04&sr=b&sig=LAaCzRqi1xUWupTHArY4zAuYkLbmkN7xgC6%2Bnt%2BBWmY%3D" -OutFile "C:\Viohalco_Config\Server_Background_File.jpg" }
            TestScript = { Test-Path "C:\Viohalco_Config\Server_Background_File.jpg" }
            GetScript = { @{ Result = (Get-Content C:\Viohalco_Config\Server_Background_File.jpg) } }
            DependsOn = "[File]Viohalco_Config"
        }
        # Ensure that the background file has been downloaded
        File ImageBackground {
            DestinationPath = "C:\Viohalco_Config\Server_Background_File.jpg"
            Ensure = "Present"
            Type = "File"
            DependsOn = "[Script]GetImageBackGround"
        }
        # Set the background info
        rsBGInfo DeployCustomBGInfo {
			Ensure       = "Present"
            BGInfoSrc    = "https://stweuinfpsta001.blob.core.windows.net/server/background/BGInfo.zip?sp=r&st=2022-01-28T16:59:26Z&se=2025-01-27T00:59:26Z&spr=https&sv=2020-08-04&sr=b&sig=G6HbGFLGwv%2FGobK2VXT7V7JecbRAotZTWJ948tST48s%3D"
			ConfSrc      = "https://stweuinfpsta001.blob.core.windows.net/server/background/ServerBackground.bgi?sp=r&st=2022-01-28T16:57:30Z&se=2025-01-27T00:57:30Z&spr=https&sv=2020-08-04&sr=b&sig=UDP5936h%2BvLAeaMy17Ur9m7unfZ%2FeKU8A5kUjIaxldg%3D"
            ConfFileName = "ServerBackground.bgi"
            DownloadPath = "C:\Viohalco_Config"
            DependsOn    = "[Script]GetImageBackGround"
        }

        # Ensure that the bgi file has been downloaded
        File CustomBginfo {
            DestinationPath = "C:\Viohalco_Config\BGInfo.zip"
            Ensure = "Present"
            Type = "File"
            DependsOn = "[rsBGInfo]DeployCustomBGInfo"
        }
        # ~~~~~~~~~~~~~~~~~~~ ADJUST FOR BEST PERFORMANCE  ~~~~~~~~~~~~~~~~~~~
		<#
		Registry VisualFXSettingUser {
			Ensure = "Present"
			Key = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects"
			ValueName = "VisualFXSetting"
			ValueData = "2"
			ValueType = "Dword"
            PsDscRunAsCredential = $credential 
		}
		
		Registry MinAnimateUser {
			Ensure = "Present"
			Key = "HKCU:\Control Panel\Desktop\WindowMetrics"
			ValueName = "MinAnimate"
			ValueData = "0"
			ValueType = "String"
            PsDscRunAsCredential = $credential
		}
		
		Registry TaskbarAnimationsUser {
			Ensure = "Present";	
			Key = "HKCU:\Control Panel\Desktop\WindowMetrics"
			ValueName = "TaskbarAnimations"
			ValueData = "0"
			ValueType = "String"
            PsDscRunAsCredential = $credential 
		}
		
        # Apply in Windows 10
		#Registry TaskbarAnimationsMachine {
		#	Ensure = "Present"
		#	Key = "HKLM:\Control Panel\Desktop\WindowMetrics"
		#	ValueName = "TaskbarAnimations"
		#	ValueData = "0"
		#	ValueType = "String" 
		#}

        # Apply in Windows 10
		#Registry CompositionPolicyUser {
		#	Ensure = "Present"
		#	Key = "HKLM:\Control Panel\Desktop\WindowMetrics"
		#	ValueName = "CompositionPolicy"
		#	ValueData = "0"
		#	ValueType = "String" 
		#}

        # Apply in Windows 10
		#Registry ColorizationOpaqueBlendUser {
		#	Ensure = "Present"
		#	Key = "HKLM:\Control Panel\Desktop\WindowMetrics"
		#	ValueName = "ColorizationOpaqueBlend"
		#	ValueData = "0"
		#	ValueType = "String" 
		#}

		Registry AlwaysHibernateThumbnailsUser {
			Ensure = "Present"
			Key = "HKCU:\Software\Microsoft\Windows\DWM"
			ValueName = "AlwaysHibernateThumbnails"
			ValueData = "0"
			ValueType = "Dword"
            PsDscRunAsCredential = $credential 
		}

		Registry DisableThumbnailsUser {
			Ensure = "Present"
			Key = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
			ValueName = "DisableThumbnails"
			ValueData = "1"
			ValueType = "Dword"
            PsDscRunAsCredential = $credential 
		}

		Registry ListviewAlphaSelectUser {
			Ensure = "Present"
			Key = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
			ValueName = "ListviewAlphaSelect"
			ValueData = "0"
			ValueType = "String"
            PsDscRunAsCredential = $credential 
		}

		Registry DragFullWindowsUser {
			Ensure = "Present"
			Key = "HKCU:\Control Panel\Desktop"
			ValueName = "DragFullWindows"
			ValueData = "0"
			ValueType = "String"
            PsDscRunAsCredential = $credential 
		}

		Registry FontSmoothingUser {
			Ensure = "Present"
			Key = "HKCU:\Control Panel\Desktop"
			ValueName = "FontSmoothing"
			ValueData = "0"
			ValueType = "String"
            PsDscRunAsCredential = $credential 
		}

		Registry ListviewShadowUser {
			Ensure = "Present"
			Key = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
			ValueName = "ListviewShadow"
			ValueData = "0"
			ValueType = "String"
            PsDscRunAsCredential = $credential 
		}

		Registry ThemeActiveUser {
			Ensure = "Present"
			Key = "HKCU:\Software\Microsoft\Windows\CurrentVersion\ThemeManager"
			ValueName = "ThemeActive"
			ValueData = "0"
			ValueType = "String"
            PsDscRunAsCredential = $credential 
		}
		#>
		Registry ThemeActiveMachine {
			Ensure = "Present"
			Key = "HKLM:\Software\Microsoft\Windows\CurrentVersion\ThemeManager"
			ValueName = "ThemeActive"
			ValueData = "0"
			ValueType = "String"
		}
		<#
		Registry UserPreferencesMaskUser {
			Ensure = "Present"
			Key = "HKCU:\Control Panel\Desktop"
			ValueName = "UserPreferencesMask"
			ValueData = "9012038010000000"
			ValueType = "Binary"
            PsDscRunAsCredential = $credential 
		}
        # ~~~~~~~~~~~~~~~~~~~ TASKBAR ~~~~~~~~~~~~~~~~~~~
        # Set small icons on taskbar
		Registry SmallIconsTaskbarUser {
			Ensure = "Present"	
			Key = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
            Force = $true
            Hex = $true
			ValueName = "TaskbarSmallIcons"
			ValueData = "1"
			ValueType = "Dword"
            PsDscRunAsCredential = $credential
		}

        Registry ExpandTaskBarUser {
			Ensure = "Present"
			Key = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
			ValueName = "NoAutoTrayNotify"
			ValueData = "1"
			ValueType = "Dword"
            PsDscRunAsCredential = $credential
		}

		Registry ShowAllIconsInNotificationAreaUser {
			Ensure = "Present"
			Key = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer"
			ValueName = "EnableAutoTray"
			ValueData = "0"
			ValueType = "Dword"
            PsDscRunAsCredential = $credential
		}
		#>
		Registry ExpandTaskBarMachine {
			Ensure = "Present";	
			Key = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
			ValueName = "NoAutoTrayNotify"
			ValueData = "1"
			ValueType = "Dword"
		}

        # ~~~~~~~~~~~~~~~~~~~ SECURITY ~~~~~~~~~~~~~~~~~~~
        RegistryPolicyFile TurnOffSmb1
        {
			Ensure = "Present";	
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

        #NetBios DisableNetBios
        #{
        #    InterfaceAlias = 'Ethernet'
        #    Setting        = 'Disable'
        #}
    }
}
#CommonServerConfig -OutputPath 'C:\Users\t1_distathopoulos\Desktop\CommonServerConfig'
#Start-DscConfiguration -Path C:\Users\t1_distathopoulos\Desktop\CommonServerConfig -Wait -Verbose -Force