# DHCP deaktivieren:
Set-NetIPInterface -InterfaceAlias "Ethernet" -AddressFamily IPv4 -DHCP Disabled -PassThru
 
# IPs ändern:
New-NetIPAddress -AddressFamily IPv4 -InterfaceAlias "Ethernet" -IPAddress 172.16.16.10 -PrefixLength 24 -DefaultGateway 172.16.16.1
 
# DNS ändern:
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses 172.16.16.10
 
# IPv6 deaktivieren:
Disable-NetAdapterBinding -Name Ethernet -ComponentID ms_tcpip6

# Services installieren:
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools 
Install-ADDSForest -DomainName "M169.local" -CreateDnsDelegation:$false -ForestMode "WinThreshold" -DomainMode "WinThreshold" -DomainNetbiosName "M169" -InstallDns:$true -DatabasePath "C:\Windows\NTDS" -LogPath "C:\Windows\NTDS" -SysvolPath "C:\Windows\SYSVOL" -NoRebootOnCompletion:$false -Force:$true -SafeModeAdministratorPassword $(convertto-securestring -string "Admin123" -asplaintext -force)