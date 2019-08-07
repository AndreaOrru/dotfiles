#!/bin/sh

dconf reset -f /
dconf load / < config
sleep 1
dconf write '/org/gnome/shell/favorite-apps' "`grep favorite-apps config | cut -d '=' -f 2`"
