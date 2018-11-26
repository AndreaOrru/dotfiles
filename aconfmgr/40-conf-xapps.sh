if [[ "$HOSTNAME" == "manhattan" ]]; then
  # No Wayland, map Caps Lock to Ctrl/Escape.
  CopyFile /etc/gdm/custom.conf
  CopyFile /etc/xdg/autostart/xcape.desktop
else
  # Manually enable LCD filter and sub pixel hinting.
  CreateLink /etc/fonts/conf.d/10-sub-pixel-rgb.conf ../conf.avail/10-sub-pixel-rgb.conf
  CreateLink /etc/fonts/conf.d/11-lcdfilter-default.conf ../conf.avail/11-lcdfilter-default.conf
fi

# Force CrOS fonts.
CopyFile /etc/fonts/local.conf

CopyFile /etc/xdg/kitty/base16-gruvbox-dark-medium-256.conf
CopyFile /etc/xdg/kitty/kitty.conf

CopyFile /usr/local/bin/spotify 755
