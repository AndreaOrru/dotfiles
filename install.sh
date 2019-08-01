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
stow binaries
stow git
stow gnome
stow mpv
stow pdbpp
stow termite
stow tmux
stow zsh

./_emacs/install.sh
stow spacemacs
