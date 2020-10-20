#!/bin/sh

pacman -Qmq | grep -Ee '-(cvs|svn|git|hg|bzr|darcs)$' | grep -v ttf-google-fonts-git | grep -v emacs-pgtk-native-comp-git | yay -S --needed -
