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
    Import-DscResource -ModuleName rsBGInfo
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
        rsBGInfo DeployCustomBGInfo {
			Ensure       = "Present"
			ConfSrc      = "https://stweuinfpsta001.blob.core.windows.net/endpoint/logos/ServerBackground.bgi?sv=2019-12-12&st=2021-01-19T10%3A24%3A01Z&se=2021-01-20T10%3A24%3A01Z&sr=b&sp=r&sig=rxaj9kJxhAbQKRfPYP0l%2BlwzpFbV%2BwdxwLbA09ESaMg%3D"
			ConfPath     = "C:\BgInfo"
		}
    }
}
CommonServerConfig -OutputPath 'C:\Users\t1_distathopoulos\Desktop\CommonServerConfig'
Start-DscConfiguration -Path C:\Users\t1_distathopoulos\Desktop\CommonServerConfig -Wait -Verbose -Force