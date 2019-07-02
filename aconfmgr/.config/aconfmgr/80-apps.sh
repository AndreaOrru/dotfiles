# Firefox.
AddPackage firefox # Standalone web browser from mozilla.org
AddPackage hunspell-en_GB # GB English hunspell dictionaries
AddPackage --foreign profile-cleaner # Reduces profile size by cleaning their sqlite databases.
CopyFile /etc/profile.d/mozilla-xinput2.sh # Enable touchscreen on Firefox.

# Spotify.
AddPackage --foreign spotify # A proprietary music streaming service
CopyFile /usr/local/bin/spotify 755 # Hi-DPI aware Spotify wrapper.

# Wine.
AddPackage wine-staging # A compatibility layer for running Windows programs - Staging branch
AddPackage wine_gecko # Wine's built-in replacement for Microsoft's Internet Explorer
AddPackage winetricks # Script to install various redistributable runtime libraries in Wine.

# Others.
AddPackage anki # Helps you remember facts (like words/phrases in a foreign language) efficiently
AddPackage --foreign bsnes-plus-git # debug-oriented fork of bsnes v073
AddPackage gimp # GNU Image Manipulation Program
AddPackage mpv # a free, open source, and cross-platform media player
AddPackage playerctl # mpris media player controller and lib for spotify, vlc, audacious, bmp, xmms2, and others.
AddPackage termite # A simple VTE-based terminal
AddPackage youtube-viewer # Command line utility for viewing YouTube videos
