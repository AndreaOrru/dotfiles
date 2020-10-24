# Firefox.
AddPackage firefox # Standalone web browser from mozilla.org
AddPackage --foreign ff2mpv-native-messaging-host-git # Native Messaging Host for ff2mpv firefox addon.
AddPackage hunspell-en_US # US English hunspell dictionaries
AddPackage profile-cleaner # Simple script to vacuum and reindex sqlite databases used by browsers

AddPackage blueberry # Bluetooth configuration tool
AddPackage chromium # A web browser built for speed, simplicity, and security
AddPackage --foreign discord_arch_electron # Discord (popular voice + video app) using the system provided electron for increased security and performance
AddPackage evince # Document viewer (PDF, Postscript, djvu, tiff, dvi, XPS, SyncTex support with gedit, comics books (cbr,cbz,cb7 and cbt))
AddPackage gimp # GNU Image Manipulation Program
AddPackage imv # Image viewer for Wayland and X11
AddPackage kitty # A modern, hackable, featureful, OpenGL-based terminal emulator
AddPackage --foreign lk4b # A small program which locks your keyboard but leaves your mouse free
AddPackage mpv # a free, open source, and cross-platform media player
AddPackage --foreign spotify # A proprietary music streaming service
AddPackage --foreign pomotroid-bin # Simple and visually-pleasing Pomodoro timer
AddPackage telegram-desktop # Official Telegram Desktop client
AddPackage transmission-gtk # Fast, easy, and free BitTorrent client (GTK+ GUI)

AddPackage virtualbox # Powerful x86 virtualization for enterprise as well as home use
AddPackage virtualbox-guest-iso # The official VirtualBox Guest Additions ISO image
AddPackage virtualbox-host-dkms # VirtualBox Host kernel modules sources

AddPackage --foreign bsnes-plus-git # debug-oriented fork of bsnes v073
AddPackage snes9x-gtk # Portable Super Nintendo Entertainment System (TM) emulator
IgnorePath '/usr/lib/libsnesmusic.so.1'
IgnorePath '/usr/lib/libsnesfilter.so.1'
IgnorePath '/usr/lib/libsnesreader.so.1'
IgnorePath '/usr/lib/libsupergameboy.so.1'
