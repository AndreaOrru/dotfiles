#!/bin/sh

chmod 700 secrets/.ssh
chmod 600 secrets/.ssh/*
chmod 644 secrets/.ssh/id_rsa.pub
stow secrets

stow git
stow kitty
stow mpv
stow pastebinit
stow sway
stow tmux
stow zsh
