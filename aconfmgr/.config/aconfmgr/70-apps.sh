# Firefox.
CopyFile /etc/profile.d/firefox-vars.sh
AddPackage firefox # Standalone web browser from mozilla.org
AddPackage hunspell-en_US # US English hunspell dictionaries
AddPackage profile-cleaner # Simple script to vacuum and reindex sqlite databases used by browsers
AddPackage --foreign ff2mpv-native-messaging-host-git # Native Messaging Host for ff2mpv firefox addon.

# Chromium.
AddPackage chromium # A web browser built for speed, simplicity, and security
AddPackage libpipewire02 # User space API to deal with multimedia pipelines (0.2)
AddPackage pipewire-jack # Server and user space API to deal with multimedia pipelines (JACK support)
AddPackage pipewire-pulse # Server and user space API to deal with multimedia pipelines (PulseAudio support)
AddPackage xdg-desktop-portal # Desktop integration portals for sandboxed apps
AddPackage xdg-desktop-portal-gtk # A GTK+ backend for xdg-desktop-portal

AddPackage --foreign anki-official-binary-bundle # The official binary shipped with the tested versions of the dependent libraries.
AddPackage atril # MATE document viewer
AddPackage discord # All-in-one voice and text chat for gamers that's free and secure.
AddPackage kitty # A modern, hackable, featureful, OpenGL-based terminal emulator
AddPackage gimp # GNU Image Manipulation Program
AddPackage mpv # a free, open source, and cross-platform media player
AddPackage playerctl # mpris media player controller and lib for spotify, vlc, audacious, bmp, xmms2, and others.
AddPackage --foreign skypeforlinux-preview-bin # Skype for Linux - Preview/Insider Version
AddPackage --foreign spotify # A proprietary music streaming service
AddPackage telegram-desktop # Official Telegram Desktop client
AddPackage transmission-gtk # Fast, easy, and free BitTorrent client (GTK+ GUI)
AddPackage youtube-viewer # Command line utility for viewing YouTube videos
AddPackage --foreign zoom # Video Conferencing and Web Conferencing Service

AddPackage virtualbox # Powerful x86 virtualization for enterprise as well as home use
AddPackage virtualbox-guest-iso # The official VirtualBox Guest Additions ISO image
AddPackage virtualbox-host-dkms # VirtualBox Host kernel modules sources
