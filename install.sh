#!/bin/sh

chmod 700 secrets/.ssh
chmod 600 secrets/.ssh/*
chmod 644 secrets/.ssh/id_rsa.pub
stow secrets

stow tmux
stow zsh
