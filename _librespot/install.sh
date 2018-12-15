#!/bin/sh

mkdir -p ~/dev
[[ -d ~/dev/librespot ]] && exit

hub clone librespot ~/dev/librespot
cd ~/dev/librespot

cargo build --release --example download
