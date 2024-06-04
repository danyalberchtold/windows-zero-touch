# DHCP deaktivieren:
Set-NetIPInterface -InterfaceAlias "Ethernet" -AddressFamily IPv4 -DHCP Disabled -PassThru
 
# IPs ändern:
New-NetIPAddress -AddressFamily IPv4 -InterfaceAlias "Ethernet" -IPAddress 172.16.16.15 -PrefixLength 24 -DefaultGateway 172.16.16.1
 
# DNS ändern:
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses 172.16.16.10
 
# IPv6 deaktivieren:
Disable-NetAdapterBinding -Name Ethernet -ComponentID ms_tcpip6