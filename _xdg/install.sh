#!/bin/sh

# Default browser.
xdg-settings set default-web-browser firefox.desktop

# Default applications.
xdg-mime default org.gnome.Evince.desktop application/pdf
xdg-mime default imv.desktop image/jpeg
xdg-mime default imv.desktop image/png
