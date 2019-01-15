# Network-related shell utils.
AddPackage aria2 # Download utility that supports HTTP(S), FTP, BitTorrent, and Metalink
AddPackage autossh # Automatically restart SSH sessions and tunnels
AddPackage elinks # An advanced and well-established feature-rich text mode web browser.
AddPackage nmap # Utility for network discovery and security auditing
AddPackage rsync # A file transfer program to keep remote files in sync
AddPackage ufw # Uncomplicated and easy to use CLI tool for managing a netfilter firewall
AddPackage wget # Network utility to retrieve files from the Web

# Firewall service.
CreateLink /etc/systemd/system/multi-user.target.wants/ufw.service /usr/lib/systemd/system/ufw.service
# Firewall configuration.
CopyFile /etc/ufw/ufw.conf
CopyFile /etc/ufw/user.rules
CopyFile /etc/ufw/user6.rules


if [ "$HOSTNAME" == "toxicity" ]; then
  # Custom DNS and simple DHCP on workstations.
  CopyFile /etc/dhcpcd.conf
  CopyFile /etc/resolv.conf

  # DHCP service.
  CreateLink /etc/systemd/system/multi-user.target.wants/dhcpcd.service /usr/lib/systemd/system/dhcpcd.service

else
  AddPackage dhclient # A standalone DHCP client from the dhcp package
  AddPackage networkmanager # Network connection manager and user applications

  # NetworkManager.
  CreateLink /etc/systemd/system/dbus-org.freedesktop.NetworkManager.service /usr/lib/systemd/system/NetworkManager.service
  CreateLink /etc/systemd/system/dbus-org.freedesktop.nm-dispatcher.service /usr/lib/systemd/system/NetworkManager-dispatcher.service
  CreateLink /etc/systemd/system/multi-user.target.wants/NetworkManager.service /usr/lib/systemd/system/NetworkManager.service
  CreateLink /etc/systemd/system/network-online.target.wants/NetworkManager-wait-online.service /usr/lib/systemd/system/NetworkManager-wait-online.service

  # No custom DNS on laptop (because of WiFi hotspots).
  IgnorePath /etc/resolv.conf
fi
