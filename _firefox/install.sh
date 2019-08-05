#!/bin/sh

SCRIPT=`realpath $0`
DIR=`dirname $SCRIPT`

ln -vs "${DIR}/user.js" ~/.mozilla/firefox/*.default-release/
