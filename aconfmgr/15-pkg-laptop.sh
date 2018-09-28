if [[ "$HOSTNAME" == "manhattan" ]]; then
  AddPackage dhclient # A standalone DHCP client from the dhcp package
  AddPackage networkmanager # Network connection manager and user applications
  AddPackage tlp # Linux Advanced Power Management
  AddPackage x86_energy_perf_policy # Read or write MSR_IA32_ENERGY_PERF_BIAS
fi
