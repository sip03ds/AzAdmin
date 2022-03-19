$subs = Get-AzSubscription | select-Object $_.Id
foreach ($sub in $subs ) {
    Write-Host "sub: $sub"
    Set-AzContext -SubscriptionId $sub
    Write-Host " context CHANGED"
    # Resource Providers for Azure Arc for servers: https://docs.microsoft.com/en-us/azure/azure-arc/servers/learn/quick-enable-hybrid-vm
    Register-AzResourceProvider -ProviderNamespace Microsoft.HybridCompute
    Register-AzResourceProvider -ProviderNamespace Microsoft.HybridConnectivity
    Register-AzResourceProvider -ProviderNamespace Microsoft.GuestConfiguration
    Register-AzResourceProvider -ProviderNamespace Microsoft.HybridContainerService
}