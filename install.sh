#!/bin/sh

#############
#  Secrets  #
#############

chmod 600 secrets/.ssh/*
chmod 644 secrets/.ssh/id_rsa.pub
stow secrets


############
#  Common  #
############

stow aconfmgr
stow alacritty
stow binaries
stow git
stow gnome
stow mpv
stow pdbpp
stow tmux
stow zsh

./_emacs/install.sh
stow spacemacs

./_zig/install.sh
