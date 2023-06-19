# Import the Active Directory module
Import-Module ActiveDirectory

# Set the time threshold (2 years)
$threshold = (Get-Date).AddYears(-2)

# Get all users from Active Directory
$users = Get-ADUser -Filter * -Properties LastLogonDate

# Create an array to store the user data
$userData = @()

# Iterate through each user and check their last logon date
foreach ($user in $users) {
    # Check if the user has never logged in or their last logon date is older than the threshold
    if (-not $user.LastLogonDate -or $user.LastLogonDate -lt $threshold) {
        # Create a custom object with the user's name and last logon date
        $userObject = [PSCustomObject]@{
            Name       = $user.Name
            LastLogon  = $user.LastLogonDate
        }

        # Add the user object to the array
        $userData += $userObject
    }
}

# Export the user data to a CSV file
$userData | Export-Csv -Path "InactiveUsers.csv" -NoTypeInformation
