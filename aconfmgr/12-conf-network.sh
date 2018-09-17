# Custom DNS.
CopyFile /etc/NetworkManager/NetworkManager.conf
CopyFile /etc/resolv.conf

# Firewall.
CopyFile /etc/default/ufw
CopyFile /etc/ufw/after.rules
CopyFile /etc/ufw/after6.rules
CopyFile /etc/ufw/ufw.conf
CopyFile /etc/ufw/user.rules
CopyFile /etc/ufw/user6.rules
