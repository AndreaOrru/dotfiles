#####################
#  Shell utilities  #
#####################

AddPackage aria2 # Download utility that supports HTTP(S), FTP, BitTorrent, and Metalink
AddPackage autossh # Automatically restart SSH sessions and tunnels
AddPackage elinks # An advanced and well-established feature-rich text mode web browser.
AddPackage nmap # Utility for network discovery and security auditing
AddPackage rsync # A file transfer program to keep remote files in sync
AddPackage wget # Network utility to retrieve files from the Web


##############
#  Firewall  #
##############

AddPackage ufw # Uncomplicated and easy to use CLI tool for managing a netfilter firewall

CreateLink /etc/systemd/system/multi-user.target.wants/ufw.service /usr/lib/systemd/system/ufw.service

CopyFile /etc/default/ufw
CopyFile /etc/ufw/after.rules
CopyFile /etc/ufw/after6.rules
CopyFile /etc/ufw/ufw.conf
CopyFile /etc/ufw/user.rules
CopyFile /etc/ufw/user6.rules


####################
#  NetworkManager  #
####################

AddPackage networkmanager # Network connection manager and user applications

CreateLink /etc/systemd/system/dbus-org.freedesktop.nm-dispatcher.service /usr/lib/systemd/system/NetworkManager-dispatcher.service
CreateLink /etc/systemd/system/multi-user.target.wants/NetworkManager.service /usr/lib/systemd/system/NetworkManager.service
CreateLink /etc/systemd/system/network-online.target.wants/NetworkManager-wait-online.service /usr/lib/systemd/system/NetworkManager-wait-online.service

# Use dhclient for DHCP.
AddPackage dhclient # A standalone DHCP client from the dhcp package
CopyFile /etc/NetworkManager/conf.d/dhcp-client.conf

# Use iwd instead of wpa_supplicant as wifi backend.
AddPackage iwd # Internet Wireless Daemon
CopyFile /etc/NetworkManager/conf.d/wifi-backend.conf

# No custom DNS.
IgnorePath /etc/resolv.conf


###################
#  Miscellaneous  #
###################

# Time synchronization.
CreateLink /etc/systemd/system/dbus-org.freedesktop.timesync1.service /usr/lib/systemd/system/systemd-timesyncd.service
CreateLink /etc/systemd/system/sysinit.target.wants/systemd-timesyncd.service /usr/lib/systemd/system/systemd-timesyncd.service
