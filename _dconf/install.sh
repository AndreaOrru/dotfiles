#!/bin/sh

dconf reset -f /
dconf load / < config
dconf write '/org/gnome/shell/favorite-apps' "`grep favorite-apps config | cut -d '=' -f 2`"
