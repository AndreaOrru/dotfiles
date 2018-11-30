AddPackageGroup xorg
RemovePackage xf86-video-vesa # X.org vesa video driver


# Fonts.
AddPackage ttf-dejavu # Font family based on the Bitstream Vera Fonts with a wider range of characters
AddPackage --foreign ttf-google-fonts-git # TrueType fonts from the Google Fonts project (git version)
AddPackage --foreign ttf-mononoki-git # Monospace font for programmers, successor of monoOne
# Force CrOS fonts.
CopyFile /etc/fonts/local.conf


# Xorg utilities.
AddPackage xcape # Configure modifier keys to act as other keys when pressed and released on their own
AddPackage xsel # XSel is a command-line program for getting and setting the contents of the X selection


# Drivers.
if [ "$AMD_GRAPHICS" == true ]; then
  AddPackage xf86-video-amdgpu # X.org amdgpu video driver
elif [ "$INTEL_GRAPHICS" == true ]; then
  AddPackage xf86-video-intel # X.org Intel i810/i830/i915/945G/G965+ video drivers
fi


if [ "$LAPTOP" == true ]; then
  AddPackageGroup gnome
  RemovePackage epiphany # A GNOME web browser based on the WebKit rendering engine
  RemovePackage gnome-contacts # Contacts Manager for GNOME
  RemovePackage gnome-getting-started-docs # Help a new user get started in GNOME
  RemovePackage gnome-maps # A simple GNOME 3 maps application
  RemovePackage gnome-music # Music player and management application
  RemovePackage gnome-remote-desktop # GNOME Remote Desktop server
  RemovePackage gnome-software # GNOME Software Tools
  RemovePackage gnome-terminal # The GNOME Terminal Emulator
  RemovePackage gnome-todo # Task manager for GNOME
  RemovePackage gnome-user-docs # User documentation for GNOME
  RemovePackage orca # Screen reader for individuals who are blind or visually impaired
  RemovePackage rygel # UPnP AV MediaServer and MediaRenderer that allows you to easily share audio, video and pictures, and control of media player on your home network
  RemovePackage totem # Movie player for the GNOME desktop based on GStreamer
  RemovePackage yelp # Get help with GNOME

  AddPackage dconf-editor # dconf Editor
  AddPackage gnome-tweaks # Graphical interface for advanced GNOME 3 settings (Tweak Tool)

  # Disable Wayland, map Caps Lock to Ctrl/Escape.
  CopyFile /etc/gdm/custom.conf
  CopyFile /etc/xdg/autostart/xcape.desktop

  # Gnome / GDM and related services.
  CreateLink /etc/systemd/system/display-manager.service /usr/lib/systemd/system/gdm.service
  CreateLink /etc/systemd/user/default.target.wants/xdg-user-dirs-update.service /usr/lib/systemd/user/xdg-user-dirs-update.service
  CreateLink /etc/systemd/user/sockets.target.wants/pipewire.socket /usr/lib/systemd/user/pipewire.socket

else
  AddPackage awesome # Highly configurable framework window manager
  AddPackage xorg-xinit # X.Org initialisation program

  # Manually enable LCD filter and sub pixel hinting.
  CreateLink /etc/fonts/conf.d/10-sub-pixel-rgb.conf ../conf.avail/10-sub-pixel-rgb.conf
  CreateLink /etc/fonts/conf.d/11-lcdfilter-default.conf ../conf.avail/11-lcdfilter-default.conf

  # Start X at shell login.
  cat >> "$(GetPackageOriginalFile zsh /etc/zsh/zprofile)" <<'EOF'
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
EOF
fi
