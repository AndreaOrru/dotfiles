if [[ "$HOSTNAME" == "toxicity" ]]; then
  # Custom DNS.
  CopyFile /etc/dhcpcd.conf
  CopyFile /etc/resolv.conf
else
  # No custom DNS on laptop (because of WiFi hotspots).
  IgnorePath /etc/resolv.conf

  # Wireless connections.
  CopyFile /etc/NetworkManager/system-connections/AndyPhone 600
  CopyFile /etc/NetworkManager/system-connections/BTBHub6-H5MP 600
  CopyFile /etc/NetworkManager/system-connections/Clarence’s\ iPhone\ X🅂 600
  CopyFile /etc/NetworkManager/system-connections/Dot11 600
  CopyFile /etc/NetworkManager/system-connections/GAP-5G 600
  CopyFile /etc/NetworkManager/system-connections/NETGEAR_5GEXT 600
  CopyFile /etc/NetworkManager/system-connections/Printroom\ Cafe 600
  CopyFile /etc/NetworkManager/system-connections/TNCAP617AA5\ 5G 600
  CopyFile /etc/NetworkManager/system-connections/TOG5 600
  CopyFile /etc/NetworkManager/system-connections/TP-LINK_F35C 600
  CopyFile /etc/NetworkManager/system-connections/VM9882114 600
  CopyFile /etc/NetworkManager/system-connections/WebPocket-53E0 600
  CopyFile /etc/NetworkManager/system-connections/Wireless-N 600
fi

# Firewall.
CopyFile /etc/default/ufw
CopyFile /etc/ufw/after.rules
CopyFile /etc/ufw/after6.rules
CopyFile /etc/ufw/ufw.conf
CopyFile /etc/ufw/user.rules
CopyFile /etc/ufw/user6.rules
