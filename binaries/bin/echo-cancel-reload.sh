#!/bin/sh

aecArgs="analog_gain_control=0 digital_gain_control=1 intelligibility_enhancer=1 extended_filter=1"
newSourceName="echoCancel_source"
newSinkName="echoCancel_sink"

pactl unload-module module-echo-cancel 2>/dev/null
if pactl load-module module-echo-cancel use_master_format=1 aec_method=webrtc aec_args=\"$aecArgs\" source_name=$newSourceName sink_name=$newSinkName; then
  pacmd set-default-source $newSourceName
  pacmd set-default-sink $newSinkName
fi
