# Import the Active Directory module
Import-Module ActiveDirectory

# Set the time threshold (2 years)
$threshold = (Get-Date).AddYears(-2)

# Get all computers from Active Directory
$computers = Get-ADComputer -Filter * -Properties LastLogonTimestamp

# Create an array to store the computer data
$computerData = @()

# Iterate through each computer and check its last logon timestamp
foreach ($computer in $computers) {
    # Check if the computer has never been logged into or its last logon timestamp is older than the threshold
    if (-not $computer.LastLogonTimestamp -or $computer.LastLogonTimestamp -lt $threshold) {
        # Create a custom object with the computer's name and last logon timestamp
        $computerObject = [PSCustomObject]@{
            Name           = $computer.Name
            LastLogon      = $computer.LastLogonTimestamp
        }

        # Add the computer object to the array
        $computerData += $computerObject
    }
}

# Export the computer data to a CSV file
$computerData | Export-Csv -Path "InactiveComputers.csv" -NoTypeInformation
