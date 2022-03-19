$step=$args[0]

if ($args.length -eq 1) {
  $serverList=$args[0]
  if ( $serverList -eq "UserNames.txt" ) {
	foreach($line in Get-Content $serverList) {
		$user=Get-ADUser -Identity $line -Properties extensionAttribute6;
		Set-ADUser –Identity $user -add @{"extensionattribute6"="MFA2"};
	}	  
  }
}