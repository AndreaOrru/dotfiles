#!/bin/sh

mkdir -p ~/dev
[[ -d ~/dev/zig ]] && exit

git clone https://github.com/ziglang/zig ~/dev/zig
cd ~/dev/zig

mkdir build
cd build
cmake ..
make
make install
