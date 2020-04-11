# Firefox.
CopyFile /etc/profile.d/firefox-vars.sh
AddPackage firefox # Standalone web browser from mozilla.org
AddPackage hunspell-en_US # US English hunspell dictionaries
AddPackage profile-cleaner # Simple script to vacuum and reindex sqlite databases used by browsers

AddPackage --foreign anki-official-binary-bundle # The official binary shipped with the tested versions of the dependent libraries.
AddPackage atril # MATE document viewer
AddPackage chromium # A web browser built for speed, simplicity, and security
AddPackage kitty # A modern, hackable, featureful, OpenGL-based terminal emulator
AddPackage gimp # GNU Image Manipulation Program
AddPackage mpv # a free, open source, and cross-platform media player
AddPackage playerctl # mpris media player controller and lib for spotify, vlc, audacious, bmp, xmms2, and others.
AddPackage --foreign spotify # A proprietary music streaming service
AddPackage transmission-gtk # Fast, easy, and free BitTorrent client (GTK+ GUI)
AddPackage youtube-viewer # Command line utility for viewing YouTube videos
