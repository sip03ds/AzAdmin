# SSH Configuration for Creating the SSH key on Azure

[ssh.ps1](https://github.com/sip03ds/AzAdmin/blob/original/RSyslog_Sentinel/ssh/ssh.ps1)

1. Create the RSA key
2. Replace username & hostnmae on public RSA key
3. Update ARM template with public RSA key
4. Create the key on Azure

It is **EXTREMMELY IMPORTANT** to note that you need to **keep** and **safeguard** and never lose the private RSA key.Otherwise you wil lose access to the VMs.

[Reference](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/mac-create-ssh-keys)