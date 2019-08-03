#!/bin/sh

volume="$(pamixer --get-volume)%"
readarray inputs <<< $(pacmd list-sink-inputs | grep "    index:")

for input in "${inputs[@]}"
do
    input=$(echo $input | cut -d ' ' -f 2)
    pactl set-sink-input-volume $input $volume
done
