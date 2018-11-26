if [[ "$HOSTNAME" == "toxicity" ]]; then
  AddPackage awesome # Highly configurable framework window manager
  AddPackage xorg-xinit # X.Org initialisation program

else
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
fi
