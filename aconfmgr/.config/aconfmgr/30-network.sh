####################
#  NetworkManager  #
####################

AddPackage networkmanager # Network connection manager and user applications

CreateLink /etc/systemd/system/dbus-org.freedesktop.nm-dispatcher.service /usr/lib/systemd/system/NetworkManager-dispatcher.service
CreateLink /etc/systemd/system/multi-user.target.wants/NetworkManager.service /usr/lib/systemd/system/NetworkManager.service
CreateLink /etc/systemd/system/network-online.target.wants/NetworkManager-wait-online.service /usr/lib/systemd/system/NetworkManager-wait-online.service

# Custom DNS.
CopyFile /etc/NetworkManager/conf.d/dns.conf
CopyFile /etc/resolv.conf


#####################
#  Shell utilities  #
#####################

AddPackage aria2 # Download utility that supports HTTP(S), FTP, BitTorrent, and Metalink
AddPackage openssh # Premier connectivity tool for remote login with the SSH protocol
AddPackage --foreign tzupdate # Set the system timezone based on IP geolocation
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


###################
#  Miscellaneous  #
###################

# Time synchronization.
CreateLink /etc/systemd/system/dbus-org.freedesktop.timesync1.service /usr/lib/systemd/system/systemd-timesyncd.service
CreateLink /etc/systemd/system/sysinit.target.wants/systemd-timesyncd.service /usr/lib/systemd/system/systemd-timesyncd.service
