# Start Sway on login on tty1.
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  sway
fi
