AddPackageGroup xorg
RemovePackage xf86-video-vesa # X.org vesa video driver


# Fonts.
AddPackage ttf-dejavu # Font family based on the Bitstream Vera Fonts with a wider range of characters
AddPackage --foreign ttf-google-fonts-git # TrueType fonts from the Google Fonts project (git version)
AddPackage --foreign ttf-mononoki-git # Monospace font for programmers, successor of monoOne
# Japanese fonts.
AddPackage adobe-source-han-sans-jp-fonts # Adobe Source Han Sans Subset OTF - Japanese OpenType/CFF fonts
AddPackage --foreign kanjistrokeorders-ttf # Kanji stroke order font
AddPackage ttf-hanazono # A free Japanese kanji font, which contains about 78,685 characters (and 2 SPACEs) defined in ISO/IEC 10646 standard / the Unicode standard.
AddPackage ttf-ibm-plex # IBM Plex Mono, Sans, and Serif
# Force CrOS fonts.
CopyFile /etc/fonts/local.conf


# Xorg utilities.
AddPackage xcape # Configure modifier keys to act as other keys when pressed and released on their own
AddPackage xclip # Command line interface to the X11 clipboard
AddPackage xsel # XSel is a command-line program for getting and setting the contents of the X selection


# Drivers.
if [ "$AMD_GRAPHICS" == true ]; then
  AddPackage xf86-video-amdgpu # X.org amdgpu video driver
  AddPackage libva-mesa-driver # VA-API implementation for gallium
  AddPackage mesa-vdpau # Mesa VDPAU drivers
  AddPackage vdpauinfo # Command line utility for querying the capabilities of a VDPAU device.
elif [ "$INTEL_GRAPHICS" == true ]; then
  AddPackage xf86-video-intel # X.org Intel i810/i830/i915/945G/G965+ video drivers
  AddPackage intel-media-driver # Intel Media Driver for VAAPI — Broadwell+ iGPUs
  CopyFile /etc/profile.d/libva-driver.sh
fi
AddPackage libva-utils # Intel VA-API Media Applications and Scripts for libva


if [ "$LAPTOP" == true ]; then
  AddPackageGroup gnome
  RemovePackage epiphany # A GNOME web browser based on the WebKit rendering engine
  RemovePackage gnome-books # Access and organize your e-books on GNOME
  RemovePackage gnome-contacts # Contacts Manager for GNOME
  RemovePackage gnome-getting-started-docs # Help a new user get started in GNOME
  RemovePackage gnome-maps # A simple GNOME 3 maps application
  RemovePackage gnome-music # Music player and management application
  RemovePackage gnome-remote-desktop # GNOME Remote Desktop server
  RemovePackage gnome-software # GNOME Software Tools
  RemovePackage gnome-terminal # The GNOME Terminal Emulator
  RemovePackage gnome-todo # Task manager for GNOME
  RemovePackage gnome-user-docs # User documentation for GNOME
  RemovePackage gnome-weather # Access current weather conditions and forecasts
  RemovePackage orca # Screen reader for individuals who are blind or visually impaired
  RemovePackage rygel # UPnP AV MediaServer and MediaRenderer that allows you to easily share audio, video and pictures, and control of media player on your home network
  RemovePackage totem # Movie player for the GNOME desktop based on GStreamer
  RemovePackage vino # A VNC server for the GNOME desktop
  RemovePackage yelp # Get help with GNOME

  AddPackage dconf-editor # dconf Editor
  AddPackage gnome-tweaks # Graphical interface for advanced GNOME 3 settings (Tweak Tool)

  # MPD integration with Gnome.
  AddPackage --foreign gnome-shell-extension-mpris-indicator-button-git # A mediaplayer indicator for the Gnome Shell

  # Gnome/GTK theme.
  AddPackage --foreign vimix-gtk-themes-git # Vimix is a flat Material Design theme for GTK 3, GTK 2 and Gnome-Shell
  AddPackage arc-icon-theme # Arc icon theme. Official releases only.

  # Disable Wayland, map Caps Lock to Ctrl/Escape.
  CopyFile /etc/gdm/custom.conf
  CopyFile /etc/xdg/autostart/xcape.desktop

  # Gnome / GDM and related services.
  CreateLink /etc/systemd/system/display-manager.service /usr/lib/systemd/system/gdm.service
  CreateLink /etc/systemd/user/default.target.wants/xdg-user-dirs-update.service /usr/lib/systemd/user/xdg-user-dirs-update.service
  CreateLink /etc/systemd/user/sockets.target.wants/pipewire.socket /usr/lib/systemd/user/pipewire.socket

  # Prevent GDM from starting its own Pulseaudio (fix for headphones).
  CopyFile /var/lib/gdm/.config/pulse/client.conf 600 gdm gdm
  CreateLink /var/lib/gdm/.config/systemd/user/pulseaudio.socket /dev/null gdm gdm
  SetFileProperty /var/lib/gdm/.config/pulse group gdm
  SetFileProperty /var/lib/gdm/.config/pulse mode 700
  SetFileProperty /var/lib/gdm/.config/pulse owner gdm
  SetFileProperty /var/lib/gdm/.config/systemd/user group gdm
  SetFileProperty /var/lib/gdm/.config/systemd/user mode 700
  SetFileProperty /var/lib/gdm/.config/systemd/user owner gdm
  SetFileProperty /var/lib/gdm/.config/systemd group gdm
  SetFileProperty /var/lib/gdm/.config/systemd mode 700
  SetFileProperty /var/lib/gdm/.config/systemd owner gdm
  SetFileProperty /var/lib/gdm/.config group gdm
  SetFileProperty /var/lib/gdm/.config mode 700
  SetFileProperty /var/lib/gdm/.config owner gdm

else
  AddPackage --foreign awesome-git # Highly configurable framework window manager
  AddPackage compton # X compositor that may fix tearing issues
  AddPackage --foreign lain-git # Layouts, asynchronous widgets and utilities for Awesome WM
  AddPackage ttf-font-awesome # Iconic font designed for Bootstrap
  AddPackage xorg-xinit # X.Org initialisation program

  # Basic desktop utilities.
  AddPackage i3lock # An improved screenlocker based upon XCB and PAM
  AddPackage redshift # Adjusts the color temperature of your screen according to your surroundings.
  AddPackage rofi # A window switcher, application launcher and dmenu replacement
  AddPackage --foreign xbanish-timeout-git # Banish the mouse cursor when typing, show it again when the mouse moves. Patched fork with extra features such as timeout, ignorescroll
  AddPackage xss-lock # Use external locker as X screen saver

  # Manually enable LCD filter and sub pixel hinting.
  CreateLink /etc/fonts/conf.d/10-sub-pixel-rgb.conf ../conf.avail/10-sub-pixel-rgb.conf
  CreateLink /etc/fonts/conf.d/11-lcdfilter-default.conf ../conf.avail/11-lcdfilter-default.conf

  # Start X at shell login.
  cat >> "$(GetPackageOriginalFile zsh /etc/zsh/zprofile)" <<'EOF'
[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1 &> /dev/null
EOF
fi
