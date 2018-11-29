AddPackage chromium # A web browser built for speed, simplicity, and security
AddPackage gimp # GNU Image Manipulation Program
AddPackage kitty # A modern, hackable, featureful, OpenGL based terminal emulator
AddPackage mpv # a free, open source, and cross-platform media player
AddPackage pgadmin4 # Comprehensive design and management interface for PostgreSQL
AddPackage --foreign postman-bin # Build, test, and document your APIs faster
AddPackage --foreign signal-desktop-bin # Private messaging from your desktop
AddPackage --foreign spotify # A proprietary music streaming service
AddPackage youtube-dl # A small command-line program to download videos from YouTube.com and a few more sites

# Terminal configuration.
CopyFile /etc/xdg/kitty/base16-gruvbox-dark-medium-256.conf
CopyFile /etc/xdg/kitty/kitty.conf

if [ "$WORKSTATION" == true ]; then
  AddPackage feh # Fast and light imlib2-based image viewer
  AddPackage i3lock # An improved screenlocker based upon XCB and PAM
  AddPackage rofi # A window switcher, application launcher and dmenu replacement
  AddPackage scrot # Simple command-line screenshot utility for X
  AddPackage --foreign xbanish-timeout-git # Banish the mouse cursor when typing, show it again when the mouse moves. Patched fork with extra features such as timeout, ignorescroll
  AddPackage xss-lock # Use external locker as X screen saver
  AddPackage zathura # Minimalistic document viewer
  AddPackage zathura-djvu # DjVu support for Zathura
  AddPackage zathura-pdf-mupdf # PDF support for Zathura (MuPDF backend) (Supports PDF, ePub, and OpenXPS)
fi

CopyFile /usr/local/bin/spotify 755
