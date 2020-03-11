#!/bin/sh

chmod 600 secrets/.ssh/*
chmod 644 secrets/.ssh/id_rsa.pub
stow secrets

stow aconfmgr
stow binaries
stow git
stow gnome
stow kitty
stow mpv
stow pdbpp
stow tmux
stow zsh

./_emacs/install.sh
stow spacemacs
