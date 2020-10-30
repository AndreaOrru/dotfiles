# Start Sway on login on tty1.
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  export XDG_CURRENT_DESKTOP=sway
  sway
fi
