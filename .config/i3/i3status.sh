#!/bin/sh

i3status --config ~/.config/i3/i3status.conf | while :
do
  read line
  playing=$(mpc current)
  if [ -z $playing ]; then
    echo $line
  else
    status="▶"
    mpc | grep -q "^\[paused\]" && status="■"
    playing="$status $playing"
    playing="[{ \"full_text\": \"${playing//\"/\\\"} \" },"
    echo "${line/[/$playing}"
  fi
done
