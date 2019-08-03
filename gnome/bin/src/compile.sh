#!/bin/sh

DIR=`dirname $0`

clang \
    -Ofast -march=native -flto \
    "${DIR}/volume_change_listener.c" \
    -o "${DIR}/../volume_change_listener"
