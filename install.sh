#!/bin/sh

chmod 600 secrets/.ssh/*
chmod 644 secrets/.ssh/id_rsa.pub
stow secrets

stow aconfmgr
stow binaries
stow git
stow mpv
stow pdbpp
stow termite
stow tmux
stow zsh

./gnome/bin/src/compile.sh
stow gnome

./_emacs/install.sh
stow spacemacs
