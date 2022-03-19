Configuration GuestConfig {
    param
    (
    )
        
    Import-DscResource -ModuleName 'PSDscResources' -ModuleVersion "2.12.0.0"
    
    #Import-DscResource -ModuleName 'PSDesiredStateConfiguration' -ModuleVersion "2.0.5"    
    
    Node localhost {
        Registry Registry1 {
                  Key = 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\MyNewKey'
                  Ensure = 'Present'
                  ValueName = ''
        }
    } 
}

GuestConfig -OutputPath:"./GuestConfig"