# Laptop power management.
if [[ "$HOSTNAME" == "manhattan" ]]; then
  CopyFile /etc/default/tlp
fi

CopyFile /etc/php/php.ini
