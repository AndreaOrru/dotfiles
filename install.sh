#!/bin/sh

chmod 700 secrets/.ssh
chmod 600 secrets/.ssh/*
chmod 644 secrets/.ssh/id_rsa.pub
stow secrets

stow aconfmgr
stow binaries
stow emacs
stow firefox
stow git
stow kitty
stow mpv
stow pastebinit
stow pdbpp
stow pulseaudio
stow sway
stow tmux
stow xfce
stow zsh
