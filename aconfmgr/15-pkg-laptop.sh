if [[ "$HOSTNAME" == "manhattan" ]]; then
  AddPackage dhclient # A standalone DHCP client from the dhcp package
  AddPackage networkmanager # Network connection manager and user applications
  AddPackage tlp # Linux Advanced Power Management
  AddPackage x86_energy_perf_policy # Read or write MSR_IA32_ENERGY_PERF_BIAS

  # Wireless connections.
  CopyFile /etc/NetworkManager/system-connections/AndyPhone 600
  CopyFile /etc/NetworkManager/system-connections/BTBHub6-H5MP 600
  CopyFile /etc/NetworkManager/system-connections/Dot11 600
  CopyFile /etc/NetworkManager/system-connections/GAP-5G 600
  CopyFile /etc/NetworkManager/system-connections/NETGEAR_5GEXT 600
  CopyFile /etc/NetworkManager/system-connections/Printroom\ Cafe 600
  CopyFile /etc/NetworkManager/system-connections/TNCAP617AA5\ 5G 600
  CopyFile /etc/NetworkManager/system-connections/VM9882114 600
  CopyFile /etc/NetworkManager/system-connections/Wireless-N 600
fi
