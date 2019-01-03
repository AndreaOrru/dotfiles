#!/bin/sh

source ./env.sh


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
stow chromium
stow git
stow mpd
stow mpv
stow ncmpcpp
stow tmux
stow zsh

./_emacs/install.sh
./_org-todoist/install.sh
stow spacemacs

./_librespot/install.sh
./_zig/install.sh


######################
#  Machine specific  #
######################

if [ "$WORKSTATION" == true ]; then
  stow awesome
  stow compton
  stow redshift
  stow rofi
  stow xdg
  stow xinit
  stow zathura
fi
