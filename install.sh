#!/bin/sh

source ./env.sh


############
#  Common  #
############

stow aconfmgr
stow binaries
stow git
stow mpd
stow mpv
stow ncmpcpp
stow tmux
stow zsh

./_emacs/install.sh
stow spacemacs

./_librespot/install.sh
./_zig/install.sh


#############
#  Secrets  #
#############

chmod 600 secrets/.ssh/*
chmod 644 secrets/.ssh/id_rsa.pub
stow secrets


######################
#  Machine specific  #
######################

if [ "$WORKSTATION" == true ]; then
  stow awesome
  stow compton
  stow redshift
  stow rofi
  stow xinit
  stow zathura
fi
