#!/bin/sh

SCRIPT=`realpath $0`
DIR=`dirname $SCRIPT`

ln -vsf "${DIR}/user.js" ~/.mozilla/firefox/*.default-release/
