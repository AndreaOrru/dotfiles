# Firefox.
AddPackage firefox-developer-edition # Developer Edition of the popular Firefox web browser
AddPackage hunspell-en_GB # GB English hunspell dictionaries
AddPackage --foreign profile-cleaner # Reduces profile size by cleaning their sqlite databases.
CopyFile /etc/profile.d/mozilla-xinput2.sh # Enable touchscreen on Firefox.

# Spotify.
AddPackage --foreign spotify # A proprietary music streaming service
CopyFile /usr/local/bin/spotify 755 # Hi-DPI aware Spotify wrapper.

# Others.
AddPackage anki # Helps you remember facts (like words/phrases in a foreign language) efficiently
AddPackage gimp # GNU Image Manipulation Program
AddPackage kitty # A modern, hackable, featureful, OpenGL based terminal emulator
AddPackage mpv # a free, open source, and cross-platform media player
AddPackage pgadmin4 # Comprehensive design and management interface for PostgreSQL
AddPackage playerctl # mpris media player controller and lib for spotify, vlc, audacious, bmp, xmms2, and others.
AddPackage --foreign signal-desktop-bin # Private messaging from your desktop
AddPackage sqlitebrowser # SQLite Database browser is a light GUI editor for SQLite databases, built on top of Qt
AddPackage telegram-desktop # Official Telegram Desktop client
AddPackage youtube-viewer # Command line utility for viewing YouTube videos
