# Laptop power management.
if [ "$LAPTOP" == true ]; then
  CopyFile /etc/default/tlp
fi

CopyFile /etc/php/php.ini
