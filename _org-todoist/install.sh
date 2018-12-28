#!/bin/sh

mkdir -p ~/dev
[[ -d ~/dev/org-todoist.el ]] && exit

hub clone org-todoist.el ~/dev/org-todoist.el
