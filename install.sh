#!/bin/sh

chmod 600 secrets/.ssh/*
chmod 644 secrets/.ssh/id_rsa.pub
stow secrets

stow aconfmgr
stow chrome
stow git
stow gnome
stow mpv
stow pdbpp
stow spotify
stow termite
stow tmux
stow zsh

./_emacs/install.sh
stow spacemacs
