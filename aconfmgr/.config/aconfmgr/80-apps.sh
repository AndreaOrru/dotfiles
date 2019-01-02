AddPackage chromium-vaapi # Chromium with VA-API support to enable hardware acceleration
AddPackage gimp # GNU Image Manipulation Program
AddPackage kitty # A modern, hackable, featureful, OpenGL based terminal emulator
AddPackage mpv # a free, open source, and cross-platform media player
AddPackage pgadmin4 # Comprehensive design and management interface for PostgreSQL
AddPackage playerctl # mpris media player controller and lib for spotify, vlc, audacious, bmp, xmms2, and others.
AddPackage --foreign postman-bin # Build, test, and document your APIs faster
AddPackage --foreign signal-desktop-bin # Private messaging from your desktop
AddPackage --foreign spotify # A proprietary music streaming service
AddPackage youtube-viewer # Command line utility for viewing YouTube videos

# Terminal configuration.
CopyFile /etc/xdg/kitty/base16-gruvbox-dark-medium-256.conf
CopyFile /etc/xdg/kitty/kitty.conf

# Hi-DPI aware Spotify wrapper.
CopyFile /usr/local/bin/spotify 755


if [ "$AMD_GRAPHICS" == true ]; then
  # Workaround for VA-API enabled Chromium.
  sed -i -f - "$(GetPackageOriginalFile chromium-vaapi /usr/share/applications/chromium.desktop)" <<EOF
    s/^Exec=/Exec=env allow_rgb10_configs=false /
EOF
fi

if [ "$WORKSTATION" == true ]; then
  AddPackage feh # Fast and light imlib2-based image viewer
  AddPackage maim # Utility to take a screenshot using imlib2
  AddPackage zathura # Minimalistic document viewer
  AddPackage zathura-djvu # DjVu support for Zathura
  AddPackage zathura-pdf-mupdf # PDF support for Zathura (MuPDF backend) (Supports PDF, ePub, and OpenXPS)
fi
