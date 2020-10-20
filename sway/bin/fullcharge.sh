#!/bin/sh

sudo tlp fullcharge || exit 1

notify-send -t 3000 "Battery thresholds are now disabled until restart."
