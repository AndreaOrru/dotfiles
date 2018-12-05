#!/bin/sh

source ./env.sh


############
#  Common  #
############

stow binaries
stow git
stow tmux
stow zsh

./_emacs/install.sh
stow spacemacs


#############
#  Secrets  #
#############

chmod 600 secrets/.ssh/*
chmod 644 secrets/.ssh/id_rsa.pub
stow secrets


######################
#  Machine specific  #
######################

if [ "$LINUX" == true ]; then
  stow aconfmgr

  if [ "$WORKSTATION" == true ]; then
    stow awesome
    stow compton
    stow redshift
    stow rofi
    stow xinit
    stow zathura
  fi
fi
