# Sway.
AddPackage --foreign sway-hidpi-git # i3-compatible Wayland compositor, with XWayland HiDPI
AddPackage --foreign wlroots-hidpi-git # Modular Wayland compositor library, with XWayland HiDPI
AddPackage --foreign xorg-server-hidpi-git # Xorg X server (git version)

AddPackage --foreign grimshot-git # A helper for screenshots within sway.
AddPackage --foreign mako-git # Lightweight notification daemon for Wayland
AddPackage --foreign rofi-lbonn-wayland-git # A window switcher, application launcher and dmenu replacement (Wayland fork)
AddPackage --foreign swayidle-git # Idle management daemon for Wayland
AddPackage --foreign swaylock-git # Screen locker for Wayland
AddPackage --foreign waybar-git # Highly customizable Wayland bar for Sway and Wlroots based compositors (GIT)

# Wayland utilities.
AddPackage brightnessctl # Lightweight brightness control tool
AddPackage gammastep # Adjust the color temperature of your screen according to your surroundings.
AddPackage jq # Command-line JSON processor
AddPackage --foreign kanshi-git # Dynamic output configuration for Wayland WMs
AddPackage wl-clipboard # Command-line copy/paste utilities for Wayland

# Fonts.
AddPackage adobe-source-han-sans-jp-fonts # Adobe Source Han Sans Subset OTF - Japanese OpenType/CFF fonts
AddPackage adobe-source-han-serif-jp-fonts # Adobe Source Han Serif Subset OTF - Japanese OpenType/CFF fonts
AddPackage noto-fonts-emoji # Google Noto emoji fonts
AddPackage otf-font-awesome # Iconic font designed for Bootstrap
AddPackage ttf-dejavu # Font family based on the Bitstream Vera Fonts with a wider range of characters
AddPackage ttf-font-awesome # Iconic font designed for Bootstrap
AddPackage ttf-liberation # Red Hats Liberation fonts
AddPackage --foreign ttf-google-fonts-git # TrueType fonts from the Google Fonts project (git version)
AddPackage --foreign ttf-iosevka-fixed-ss09 # Typeface family designed for coding, terminal use and technical documents.
CreateLink /etc/fonts/conf.d/10-sub-pixel-rgb.conf ../conf.avail/10-sub-pixel-rgb.conf
CreateLink /etc/fonts/conf.d/11-lcdfilter-default.conf ../conf.avail/11-lcdfilter-default.conf
CopyFile /etc/fonts/local.conf

# Caps Lock remapping.
AddPackage --foreign interception-caps2esc-delay-git # caps2esc
CreateLink /etc/systemd/system/multi-user.target.wants/udevmon.service /usr/lib/systemd/system/udevmon.service
CopyFile /etc/udevmon.yaml

# XDG directories.
CreateLink /etc/systemd/user/default.target.wants/xdg-user-dirs-update.service /usr/lib/systemd/user/xdg-user-dirs-update.service
