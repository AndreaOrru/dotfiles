####################
#  Wayland + Xorg  #
####################

# Support legacy X applications.
AddPackage xorg-server-xwayland # run X clients under wayland
# X clipboard utilities (that seem to work on Wayland).
AddPackage xclip # Command line interface to the X11 clipboard
AddPackage xsel # XSel is a command-line program for getting and setting the contents of the X selection

# Environment variables to enable Wayland everywhere.
CopyFile /etc/profile.d/wayland.sh
# Wayland support for QT.
AddPackage qt5-wayland # Provides APIs for Wayland

# Caps -> Escape.
AddPackage --foreign caps2esc # caps2esc: transforming the most useless key ever in the most useful one
CreateLink /etc/systemd/system/multi-user.target.wants/caps2esc.service /usr/lib/systemd/system/caps2esc.service

# Drivers for accelerated video decoding.
AddPackage intel-media-driver # Intel Media Driver for VAAPI — Broadwell+ iGPUs
AddPackage libva-utils # Intel VA-API Media Applications and Scripts for libva
CopyFile /etc/profile.d/libva-driver.sh


###########
#  Fonts  #
###########

# General fonts.
AddPackage ttf-dejavu # Font family based on the Bitstream Vera Fonts with a wider range of characters
AddPackage --foreign ttf-google-fonts-git # TrueType fonts from the Google Fonts project (git version)
AddPackage --foreign ttf-mononoki-git # Monospace font for programmers, successor of monoOne
# Japanese fonts.
AddPackage adobe-source-han-sans-jp-fonts # Adobe Source Han Sans Subset OTF - Japanese OpenType/CFF fonts
AddPackage adobe-source-han-serif-jp-fonts # Adobe Source Han Serif Subset OTF - Japanese OpenType/CFF fonts
AddPackage --foreign kanjistrokeorders-ttf # Kanji stroke order font
AddPackage ttf-hanazono # A free Japanese kanji font, which contains about 78,685 characters (and 2 SPACEs) defined in ISO/IEC 10646 standard / the Unicode standard.
# Force CrOS fonts.
CopyFile /etc/fonts/local.conf


###########
#  GNOME  #
###########

# Core packages.
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
# Extra packages.
AddPackage dconf-editor # dconf Editor
AddPackage gnome-tweaks # Graphical interface for advanced GNOME 3 settings (Tweak Tool)

# Gnome/GTK theme.
AddPackage --foreign vimix-gtk-themes-git # Vimix is a flat Material Design theme for GTK 3, GTK 2 and Gnome-Shell
AddPackage arc-icon-theme # Arc icon theme. Official releases only.


#########
#  GDM  #
#########

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
