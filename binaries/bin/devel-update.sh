#!/bin/sh

pacman -Qmq \
    | grep -Ee '-(cvs|svn|git|hg|bzr|darcs)$' \
    | grep -v emacs-pgtk-native-comp-git \
    | grep -v ttf-google-fonts-git \
    | yay -S --needed -
