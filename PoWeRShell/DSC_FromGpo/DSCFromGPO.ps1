
Configuration DSCFromGPO
{

	Import-DSCResource -ModuleName 'PSDesiredStateConfiguration'
	Import-DSCResource -ModuleName 'AuditPolicyDSC'
	Import-DSCResource -ModuleName 'SecurityPolicyDSC'
	# Module Not Found: Import-DSCResource -ModuleName 'PowerShellAccessControl'
	Node localhost
	{
	}
}
DSCFromGPO -OutputPath 'C:\Users\distathopoulos\OneDrive - Viohalco SA\Desktop\Output'
