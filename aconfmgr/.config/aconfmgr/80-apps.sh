AddPackage firefox-developer-edition # Developer Edition of the popular Firefox web browser
AddPackage gimp # GNU Image Manipulation Program
AddPackage kitty # A modern, hackable, featureful, OpenGL based terminal emulator
AddPackage mpv # a free, open source, and cross-platform media player
AddPackage pgadmin4 # Comprehensive design and management interface for PostgreSQL
AddPackage playerctl # mpris media player controller and lib for spotify, vlc, audacious, bmp, xmms2, and others.
AddPackage --foreign signal-desktop-bin # Private messaging from your desktop
AddPackage --foreign spotify # A proprietary music streaming service
AddPackage youtube-viewer # Command line utility for viewing YouTube videos

# Hi-DPI aware Spotify wrapper.
CopyFile /usr/local/bin/spotify 755


if [ "$WORKSTATION" == true ]; then
  AddPackage feh # Fast and light imlib2-based image viewer
  AddPackage maim # Utility to take a screenshot using imlib2
  AddPackage zathura # Minimalistic document viewer
  AddPackage zathura-djvu # DjVu support for Zathura
  AddPackage zathura-pdf-mupdf # PDF support for Zathura (MuPDF backend) (Supports PDF, ePub, and OpenXPS)
fi
