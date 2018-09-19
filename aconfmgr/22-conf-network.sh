# Custom DNS.
if [[ "$HOSTNAME" == "toxicity" ]]; then
  CopyFile /etc/dhcpcd.conf
  CopyFile /etc/resolv.conf
fi

# Firewall.
CopyFile /etc/default/ufw
CopyFile /etc/ufw/after.rules
CopyFile /etc/ufw/after6.rules
CopyFile /etc/ufw/ufw.conf
CopyFile /etc/ufw/user.rules
CopyFile /etc/ufw/user6.rules
