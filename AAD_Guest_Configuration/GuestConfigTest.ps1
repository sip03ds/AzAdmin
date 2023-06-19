Configuration GuestConfigTest {
	param()
	Import-DscResource -ModuleName PsDesiredStateConfiguration


	Node 'localhost' {
        	File Viohalco_Config {
            		DestinationPath = "C:\Viohalco_Config_Guest_Config"
            		Ensure = "Present"
            		Type = "Directory"
        	}
	}
}

