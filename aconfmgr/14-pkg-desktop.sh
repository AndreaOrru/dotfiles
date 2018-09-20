if [[ "$HOSTNAME" == "toxicity" ]]; then
  AddPackage awesome # Highly configurable framework window manager
  AddPackage xorg-xinit # X.Org initialisation program
else
  #
  # gnome group
  #

  AddPackage baobab # A graphical directory tree analyzer
  AddPackage cheese # Take photos and videos with your webcam, with fun graphical effects
  AddPackage dconf-editor # dconf Editor
  AddPackage eog # Eye of Gnome
  AddPackage evince # Document viewer (PDF, Postscript, djvu, tiff, dvi, XPS, SyncTex support with gedit, comics books (cbr,cbz,cb7 and cbt))
  AddPackage file-roller # Create and modify archives
  AddPackage gdm # Display manager and login screen
  AddPackage gedit # GNOME Text Editor
  AddPackage gnome-backgrounds # Background images and data for GNOME
  AddPackage gnome-boxes # Simple GNOME application to access remote or virtual systems
  AddPackage gnome-calculator # GNOME Scientific calculator
  AddPackage gnome-calendar # Simple and beautiful calendar application designed to perfectly fit the GNOME desktop
  AddPackage gnome-characters # A character map application
  AddPackage gnome-clocks # Clocks applications for GNOME
  AddPackage gnome-color-manager # GNOME Color Profile Tools
  AddPackage gnome-control-center # GNOME's main interface to configure various aspects of the desktop
  AddPackage gnome-dictionary # Look up words in dictionary sources
  AddPackage gnome-disk-utility # Disk Management Utility for GNOME
  AddPackage gnome-documents # A document manager application for GNOME
  AddPackage gnome-font-viewer # A font viewer utility for GNOME
  AddPackage gnome-keyring # Stores passwords and encryption keys
  AddPackage gnome-logs # A log viewer for the systemd journal
  AddPackage gnome-menus # GNOME menu specifications
  AddPackage gnome-photos # Access, organize, and share your photos on GNOME
  AddPackage gnome-screenshot # Take pictures of your screen
  AddPackage gnome-session # The GNOME Session Handler
  AddPackage gnome-settings-daemon # GNOME Settings Daemon
  AddPackage gnome-shell # Next generation desktop shell
  AddPackage gnome-shell-extensions # Extensions for GNOME shell, including classic mode
  AddPackage gnome-system-monitor # View current processes and monitor system state
  AddPackage gnome-themes-extra # Extra Themes for GNOME Applications
  AddPackage gnome-tweaks # Graphical interface for advanced GNOME 3 settings (Tweak Tool)
  AddPackage gnome-user-share # Easy to use user-level file sharing for GNOME
  AddPackage gnome-video-effects # Collection of GStreamer effects for GNOME
  AddPackage grilo-plugins # A collection of plugins for the Grilo framework
  AddPackage gvfs # Virtual filesystem implementation for GIO
  AddPackage gvfs-afc # Virtual filesystem implementation for GIO (AFC backend; Apple mobile devices)
  AddPackage gvfs-goa # Virtual filesystem implementation for GIO (Gnome Online Accounts backend; cloud storage)
  AddPackage gvfs-google # Virtual filesystem implementation for GIO (Google Drive backend)
  AddPackage gvfs-gphoto2 # Virtual filesystem implementation for GIO (gphoto2 backend; PTP camera, MTP media player)
  AddPackage gvfs-mtp # Virtual filesystem implementation for GIO (MTP backend; Android, media player)
  AddPackage gvfs-nfs # Virtual filesystem implementation for GIO (NFS backend)
  AddPackage gvfs-smb # Virtual filesystem implementation for GIO (SMB/CIFS backend; Windows client)
  AddPackage mousetweaks # Mouse accessibility enhancements
  AddPackage mutter # A window manager for GNOME
  AddPackage nautilus # Default file manager for GNOME
  AddPackage simple-scan # Simple scanning utility
  AddPackage sushi # A quick previewer for Nautilus
  AddPackage vino # A VNC server for the GNOME desktop
  AddPackage xdg-user-dirs-gtk # Creates user dirs and asks to relocalize them
fi
