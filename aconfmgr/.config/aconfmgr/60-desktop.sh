#############
#  Wayland  #
#############

# Enable Wayland everywhere.
CopyFile /etc/profile.d/wayland-toolkits.sh

# Compatible GUI toolkits.
AddPackage glew-wayland # The OpenGL Extension Wrangler Library (for Wayland)
AddPackage glfw-wayland # A free, open source, portable framework for graphical application development (wayland)
AddPackage qt5-wayland # Provides APIs for Wayland


###########
#  GNOME  #
###########

AddPackageGroup gnome
AddPackage dconf-editor # dconf Editor
AddPackage gnome-tweaks # Graphical interface for advanced GNOME 3 settings (Tweak Tool)
RemovePackage gnome-software
RemovePackage gnome-terminal
RemovePackage gnome-todo

# GDM.
CreateLink /etc/systemd/system/display-manager.service /usr/lib/systemd/system/gdm.service
CreateLink /etc/systemd/user/default.target.wants/xdg-user-dirs-update.service /usr/lib/systemd/user/xdg-user-dirs-update.service
CreateLink /etc/systemd/user/sockets.target.wants/pipewire.socket /usr/lib/systemd/user/pipewire.socket
CreateLink /etc/systemd/user/sockets.target.wants/pulseaudio.socket /usr/lib/systemd/user/pulseaudio.socket


###########
#  Fonts  #
###########

AddPackage ttf-dejavu # Font family based on the Bitstream Vera Fonts with a wider range of characters
AddPackage ttf-liberation # Red Hats Liberation fonts
AddPackage --foreign ttf-google-fonts-git # TrueType fonts from the Google Fonts project (git version)
AddPackage --foreign ttf-mononoki-git # Monospace font for programmers, successor of monoOne

# Force CrOS fonts.
CopyFile /etc/fonts/local.conf


###################
#  Miscellaneous  #
###################

# Automatically switch to newly connected audio devices.
CopyFile /etc/pulse/default.pa

# Caps -> Escape/CTRL.
AddPackage --foreign interception-caps2esc-delay-git # caps2esc
CreateLink /etc/systemd/system/multi-user.target.wants/udevmon.service /usr/lib/systemd/system/udevmon.service
CopyFile /etc/udevmon.yaml

# Clipboard management.
AddPackage xclip # Command line interface to the X11 clipboard
AddPackage xsel # XSel is a command-line program for getting and setting the contents of the X selection
