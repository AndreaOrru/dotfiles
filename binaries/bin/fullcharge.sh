#!/bin/sh

sudo tlp fullcharge || exit 1

notify-send -u critical "Battery thresholds are now disabled until restart."
