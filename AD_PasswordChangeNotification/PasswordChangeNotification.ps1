<#
.Synopsis
   Script to Automated Email Reminders when Users Passwords due to Expire.
   Modified by D. Stathopoulos in order to run as scheduled task 
.DESCRIPTION
   Script to Automated Email Reminders when Users Passwords due to Expire.
   Robert Pearman / WindowsServerEssentials.com
   Version 2.9 August 2018
   Requires: Windows PowerShell Module for Active Directory
   For assistance and ideas, visit the TechNet Gallery Q&A Page. http://gallery.technet.microsoft.com/Password-Expiry-Email-177c3e27/view/Discussions#content

   Alternativley visit my youtube channel, https://www.youtube.com/robtitlerequired

   Videos are available to cover most questions, some videos are based on the earlier version which used static variables, however most of the code
   can still be applied to this version, for example for targeting groups, or email design.

   Please take a look at the existing Q&A as many questions are simply repeating earlier ones, with the same answers!


.EXAMPLE
  PasswordChangeNotification.ps1 -smtpServer mail.domain.com -expireInDays 21 -from "IT Support <support@domain.com>" -Logging -LogPath "c:\logFiles" -testing -testRecipient support@domain.com
  
  This example will use mail.domain.com as an smtp server, notify users whose password expires in less than 21 days, send mail from support@domain.com
  Logging is enabled, log path is c:\logfiles
  Testing is enabled, and test recipient is support@domain.com

.EXAMPLE
  PasswordChangeNotification.ps1 -smtpServer mail.domain.com -expireInDays 21 -from "IT Support <support@domain.com>" -reportTo myaddress@domain.com -interval 1,2,5,10,15
  
  This example will use mail.domain.com as an smtp server, notify users whose password expires in less than 21 days, send mail from support@domain.com
  Report is enabled, reports sent to myaddress@domain.com
  Interval is used, and emails will be sent to people whose password expires in less than 21 days if the script is run, with 15, 10, 5, 2 or 1 days remaining untill password expires.

#>
param(
    # $smtpServer Enter Your SMTP Server Hostname or IP Address
    [Parameter(Mandatory=$True,Position=0)]
    [ValidateNotNull()]
    [string]$smtpServer,
    # Notify Users if Expiry Less than X Days
    [Parameter(Mandatory=$True,Position=1)]
    [ValidateNotNull()]
    [int]$expireInDays,
    # From Address, eg "IT Support <support@domain.com>"
    [Parameter(Mandatory=$True,Position=2)]
    [ValidateNotNull()]
    [string]$from,
    # Logging
    [Parameter(Position=3)]
    [switch]$logging,
    # Log File Path
    [Parameter(Position=4)]
    [string]$logPath,
    # Testing Enabled
    [Parameter(Position=5)]
    [switch]$testing,
    # Test Recipient, eg recipient@domain.com
    [Parameter(Position=6)]
    [string]$testRecipient,
    # Output more detailed status to console
    [Parameter(Position=7)]
    [switch]$status,
    # Log file recipient
    [Parameter(Position=8)]
    [string]$reportto,
    # Notification Interval
    [Parameter(Position=9)]
    [array]$interval
)
###################################################################################################################

# Time / Date Info
$start = [datetime]::Now
$midnight = $start.Date.AddDays(1)
$timeToMidnight = New-TimeSpan -Start $start -end $midnight.Date
$midnight2 = $start.Date.AddDays(2)
$timeToMidnight2 = New-TimeSpan -Start $start -end $midnight2.Date
# System Settings
$textEncoding = [System.Text.Encoding]::UTF8
$today = $start
# End System Settings


# Execution Log File 
$day = $today.Day
$month = $today.Month
$year = $today.Year
$date = "$day-$month-$year"
$ExecutionlogFileName = "$date-PasswordExecutionLog.txt"
$ExecutionLogFile = $logPath, $ExecutionlogFileName -join "\"

Add-Content $ExecutionLogFile "  "

# Load AD Module
try{
    Import-Module ActiveDirectory -ErrorAction Stop
}
catch{
    Add-Content $ExecutionLogFile "Unable to load Active Directory PowerShell Module"
}


# Set Output Formatting - Padding characters
$padVal = "20"
Add-Content $ExecutionLogFile "Script Loaded"
Add-Content $ExecutionLogFile "*** Settings Summary ***"
$smtpServerLabel = "SMTP Server".PadRight($padVal," ")
$expireInDaysLabel = "Expire in Days".PadRight($padVal," ")
$fromLabel = "From".PadRight($padVal," ")
$testLabel = "Testing".PadRight($padVal," ")
$testRecipientLabel = "Test Recipient".PadRight($padVal," ")
$logLabel = "Logging".PadRight($padVal," ")
$logPathLabel = "Log Path".PadRight($padVal," ")
$reportToLabel = "Report Recipient".PadRight($padVal," ")
$interValLabel = "Intervals".PadRight($padval," ")
# Testing Values
if($testing)
{
    if(($testRecipient) -eq $null)
    {
        Add-Content $ExecutionLogFile "No Test Recipient Specified"
        Exit
    }
}
# Logging Values
if($logging)
{
    if(($logPath) -eq $null)
    {
        $logPath = $PSScriptRoot
    }
}
# Output Summary Information
Add-Content $ExecutionLogFile "$smtpServerLabel : $smtpServer"
Add-Content $ExecutionLogFile "$expireInDaysLabel : $expireInDays"
Add-Content $ExecutionLogFile "$fromLabel : $from"
Add-Content $ExecutionLogFile "$logLabel : $logging"
Add-Content $ExecutionLogFile "$logPathLabel : $logPath"
Add-Content $ExecutionLogFile "$testLabel : $testing"
Add-Content $ExecutionLogFile "$testRecipientLabel : $testRecipient"
Add-Content $ExecutionLogFile "$reportToLabel : $reportto"
Add-Content $ExecutionLogFile "$interValLabel : $interval"
Add-Content $ExecutionLogFile "*".PadRight(25,"*")

# Get Users From AD who are Enabled, Passwords Expire and are Not Currently Expired
# To target a specific OU - use the -searchBase Parameter -https://docs.microsoft.com/en-us/powershell/module/addsadministration/get-aduser
# You can target specific group members using Get-AdGroupMember, explained here https://www.youtube.com/watch?v=4CX9qMcECVQ 
# based on earlier version but method still works here.
$users = Get-ADUser -filter {(Enabled -eq $true) -and (PasswordNeverExpires -eq $false)} -properties Name, PasswordNeverExpires, PasswordExpired, PasswordLastSet, EmailAddress | where { $_.passwordexpired -eq $false }
# Count Users
$usersCount = ($users | Measure-Object).Count
Add-Content $ExecutionLogFile "Found $usersCount User Objects"
# Collect Domain Password Policy Information
$defaultMaxPasswordAge = (Get-ADDefaultDomainPasswordPolicy -ErrorAction Stop).MaxPasswordAge.Days 
Add-Content $ExecutionLogFile "Domain Default Password Age: $defaultMaxPasswordAge"
# Collect Users
$colUsers = @()
# Process Each User for Password Expiry
Add-Content $ExecutionLogFile "Process User Objects"

foreach ($user in $users)
{
    # Store User information
    $Name = $user.Name
    $emailaddress = $user.emailaddress
    $passwordSetDate = $user.PasswordLastSet
    $samAccountName = $user.SamAccountName
    $pwdLastSet = $user.PasswordLastSet
    # Check for Fine Grained Password
    $maxPasswordAge = $defaultMaxPasswordAge
    $PasswordPol = (Get-ADUserResultantPasswordPolicy -Identity $user)
    if (($PasswordPol) -ne $null )
    {
        $maxPasswordAge = ($PasswordPol).MaxPasswordAge.Days
    }
    # Create User Object
    $userObj = New-Object System.Object
    $expireson = $pwdLastSet.AddDays($maxPasswordAge)
    $daysToExpire = New-TimeSpan -Start $today -End $Expireson
	
    # Round Expiry Date Up or Down
    if(($daysToExpire.Days -eq "0") -and ($daysToExpire.TotalHours -le $timeToMidnight.TotalHours))
    {
        $userObj | Add-Member -Type NoteProperty -Name UserMessage -Value "today."
    }
    if(($daysToExpire.Days -eq "0") -and ($daysToExpire.TotalHours -gt $timeToMidnight.TotalHours) -or ($daysToExpire.Days -eq "1") -and ($daysToExpire.TotalHours -le $timeToMidnight2.TotalHours))
    {
        $userObj | Add-Member -Type NoteProperty -Name UserMessage -Value "tomorrow."
    }
    if(($daysToExpire.Days -ge "1") -and ($daysToExpire.TotalHours -gt $timeToMidnight2.TotalHours))
    {
        $days = $daysToExpire.TotalDays
        $days = [math]::Round($days)
        $userObj | Add-Member -Type NoteProperty -Name UserMessage -Value "in $days days."
    }
    $daysToExpire = [math]::Round($daysToExpire.TotalDays)
    $userObj | Add-Member -Type NoteProperty -Name UserName -Value $samAccountName
    $userObj | Add-Member -Type NoteProperty -Name Name -Value $Name
    $userObj | Add-Member -Type NoteProperty -Name EmailAddress -Value $emailAddress
    $userObj | Add-Member -Type NoteProperty -Name PasswordSet -Value $pwdLastSet
    $userObj | Add-Member -Type NoteProperty -Name DaysToExpire -Value $daysToExpire
    $userObj | Add-Member -Type NoteProperty -Name ExpiresOn -Value $expiresOn
    # Add userObj to colusers array
    $colUsers += $userObj
}

# Count Users
$colUsersCount = ($colUsers | Measure-Object).Count
Add-Content $ExecutionLogFile "$colusersCount Users processed"
# ORIGINAL VERSION Select Users to Notify
#$notifyUsers = $colUsers | where { $_.DaysToExpire -le $expireInDays} 
# MODIFIED Version
$notifyUsers = $colUsers | where { $_.DaysToExpire -le $expireInDays} | where { $_.DaysToExpire -ge 0 }
$notifiedUsers = @()
$notifyCount = ($notifyUsers | Measure-Object).Count
Add-Content $ExecutionLogFile "$notifyCount Users with expiring passwords within $expireInDays Days"
# Process notifyusers
foreach ($user in $notifyUsers)
{
    # Email Address
    $samAccountName = $user.UserName
    $emailAddress = $user.EmailAddress
    # Set Greeting Message
    $name = $user.Name
    $messageDays = $user.UserMessage
    # Subject Setting
    $subject="Your password will expire $messageDays"
    # Email Body Set Here, Note You can use HTML, including Images.
    # examples here https://youtu.be/iwvQ5tPqgW0 
    $body ="<table style=""height: 232px;"" width=""623"">
	<tbody>
	<tr style=""background-color: #273e70;"">
	<td style=""width: 613px;vertical-align: middle;""><img src=""https://stweuinfpsta001.blob.core.windows.net/endpoint/logos/viohalco_email_logo.jpg?sp=rl&st=2021-04-16T04:59:18Z&se=2021-04-17T04:59:18Z&sv=2020-02-10&sr=b&sig=sD81xOWfKw7Liyf8t70SHuZqMKkRXo96Ad4Ew0GMjh0%3D"" alt=""Viohalco Logo"" width=""256"" height=""51"" /></td>
	</tr>
	<tr>
	<td style=""width: 613px;""><span style=""color: #000080;"">Dear <strong>$name,</strong></span></td>
	</tr>
	<tr>
	<td style=""width: 613px;""><span style=""color: #000080;"">Your Password will expire $messageDays</span></td>
	</tr>
	<tr>
	<td style=""width: 613px;""><span style=""color: #000080;"">To change your password:</span></td>
	</tr>
	<tr>
	<td style=""width: 613px;"">
	<ol>
	<li><span style=""color: #000080;"">Use your <strong>corporate</strong> computer</span></li>
	<li><span style=""color: #000080;"">Ensure your computer is connected on the <strong>corporate network</strong></span></li>
	<li><span style=""color: #000080;"">Press <strong>CTRL</strong> + <strong>ALT</strong> + <strong>Delete </strong></span></li>
	<li><span style=""color: #000080;"">Choose Change Password</span></li>
	<li><span style=""color: #000080;"">Supply a password that respects corporate rules</span></li>
	</ol>
	</td>
	</tr>
	<tr>
	<td style=""width: 613px;""><span style=""color: #000080;"">In case you have more that one computer - you just have to connect your computers on the corporate network.</span></td>
	</tr>
	<tr>
	<td style=""width: 613px;""><span style=""color: #000080;"">Our systems will automatically update your computers with your new password within 15 minutes.</span></td>
	</tr>
	<tr>
	<td style=""width: 613px;""><span style=""color: #000080;"">You have to manually update your new password on your mobile phone.</span></td>
	</tr>
	<tr>
	<td style=""width: 613px;""><span style=""color: #000080;"">&nbsp;</span></td>
	</tr>
	<tr>
	<td style=""width: 613px;""><span style=""color: #000080;"">Thank you for complying with our corporate policy and pay attention for keeping our company cybersafe.</span></td>
	</tr>
	<tr>
	<td style=""width: 613px;""><span style=""color: #000080;""><strong>Your IT Department</span></strong></td>
	</tr>
	<tr>
	<td style=""width: 613px;""><hr/></td>
	</tr>
	<tr style=""background-color: #273e70;"">
	<td style=""width: 613px;""><span style=""color: #ffffff;"">IT Support:&nbsp;<a style=""color: #ffffff;"">it@vionet.gr</a> | Int. 601010 Ext. +30 2106861010</span></td>
	</tr>
	</tbody>
	</table>
    "
    # If Testing Is Enabled - Email Administrator
    if($testing)
    {
        $emailaddress = $testRecipient
    } # End Testing
    # If a user has no email address listed
    if(($emailaddress) -eq $null)
    {
        $emailaddress = $testRecipient    
    }# End No Valid Email
    $samLabel = $samAccountName.PadRight($padVal," ")
    try{
        # If using interval paramter - follow this section
        if($interval)
        {
            $daysToExpire = [int]$user.DaysToExpire
            # check interval array for expiry days
            if(($interval) -Contains($daysToExpire))
            {
                # if using status - output information to console
                if($status)
                {
                    Add-Content $ExecutionLogFile "Sending Email : $samLabel : $emailAddress"
                }
                # Send message - if you need to use SMTP authentication watch this video https://youtu.be/_-JHzG_LNvw
				# COMMENT:
                Send-Mailmessage -smtpServer $smtpServer -from $from -to $emailaddress -subject $subject -body $body -bodyasHTML -priority High -Encoding $textEncoding -ErrorAction Stop
                $user | Add-Member -MemberType NoteProperty -Name SendMail -Value "OK"
            }
            else
            {
                # if using status - output information to console
                # No Message sent
                if($status)
                {
                    Add-Content $ExecutionLogFile "Sending Email : $samLabel : $emailAddress : Skipped - Interval"
                }
                $user | Add-Member -MemberType NoteProperty -Name SendMail -Value "Skipped - Interval"
            }
        }
        else
        {
            # if not using interval paramter - follow this section
            # if using status - output information to console
            if($status)
            {
                Add-Content $ExecutionLogFile "Sending Email : $samLabel : $emailAddress"
            }
			# COMMENT
            # Send-Mailmessage -smtpServer $smtpServer -from $from -to $emailaddress -subject $subject -body $body -bodyasHTML -priority High -Encoding $textEncoding -ErrorAction Stop
            $user | Add-Member -MemberType NoteProperty -Name SendMail -Value "OK"
        }
    }
    catch{
        # error section
        $errorMessage = $_.exception.Message
        # if using status - output information to console
        if($status)
        {
           $errorMessage
        }
        $user | Add-Member -MemberType NoteProperty -Name SendMail -Value $errorMessage    
    }
    $notifiedUsers += $user
}

if($logging)
{
    # Create Log File
    Add-Content $ExecutionLogFile "Creating Log File"
    $logFileName = "$date-PasswordLog.csv"
    if(($logPath.EndsWith("\")))
    {
       $logPath = $logPath -Replace ".$"
    }
    $logFile = $logPath, $logFileName -join "\"
    Add-Content $ExecutionLogFile "Log Output: $logfile"
    $notifiedUsers | Export-CSV $logFile
    if($reportTo)
    {
        $reportSubject = "Password Expiry Report"
        $reportBody = "Password Expiry Report Attached"
        try{
			# COMMENT
            # Send-Mailmessage -smtpServer $smtpServer -from $from -to $reportTo -subject $reportSubject -body $reportbody -bodyasHTML -priority High -Encoding $textEncoding -Attachments $logFile -ErrorAction Stop 
        }
        catch{
            $errorMessage = $_.Exception.Message
            Add-Content $ExecutionLogFile $errorMessage
        }
    }
}
$notifiedUsers | select UserName,Name,EmailAddress,PasswordSet,DaysToExpire,ExpiresOn | sort DaystoExpire | FT -autoSize

$stop = [datetime]::Now
$runTime = New-TimeSpan $start $stop
Add-Content $ExecutionLogFile "Script Runtime: $runtime"
# End