#!/bin/sh

pactl subscribe | grep --line-buffered "sink #0" | volume_change_listener
