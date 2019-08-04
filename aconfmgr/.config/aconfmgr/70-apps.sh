# Firefox.
CopyFile /etc/profile.d/firefox-vars.sh
AddPackage firefox-developer-edition # Developer Edition of the popular Firefox web browser
AddPackage hunspell-en_US # US English hunspell dictionaries
AddPackage --foreign profile-cleaner # Reduces profile size by cleaning their sqlite databases.

AddPackage chromium # A web browser built for speed, simplicity, and security
AddPackage gimp # GNU Image Manipulation Program
AddPackage mpv # a free, open source, and cross-platform media player
AddPackage playerctl # mpris media player controller and lib for spotify, vlc, audacious, bmp, xmms2, and others.
AddPackage --foreign spotify # A proprietary music streaming service
AddPackage termite # A simple VTE-based terminal
AddPackage youtube-viewer # Command line utility for viewing YouTube videos
