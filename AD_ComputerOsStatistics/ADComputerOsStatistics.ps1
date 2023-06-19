# Import the Active Directory module
Import-Module ActiveDirectory

# Get all computers from Active Directory
$computers = Get-ADComputer -Filter * -Properties OperatingSystem

# Create a hashtable to store the count of machines per operating system
$osCount = @{}

# Iterate through each computer and count the machines per operating system
foreach ($computer in $computers) {
    $operatingSystem = $computer.OperatingSystem

    # If the operating system exists in the hashtable, increment the count
    if ($osCount.ContainsKey($operatingSystem)) {
        $osCount[$operatingSystem]++
    }
    # Otherwise, initialize the count for the operating system to 1
    else {
        $osCount[$operatingSystem] = 1
    }
}

# Output the number of machines per operating system
foreach ($os in $osCount.GetEnumerator() | Sort-Object Value -Descending) {
    $operatingSystem = $os.Name
    $count = $os.Value

    Write-Host "Operating System: $operatingSystem | Count: $count"
}
