#!/bin/sh

cd user
find -type d -exec mkdir -p $HOME/{} \;
find ! -type d | sed 's|^./||' | xargs -i ln -vsf $PWD/{} $HOME/{}
