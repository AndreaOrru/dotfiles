# Start Sway on login on tty1.
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  sway
# Start XFCE on login on tty2.
elif [[ ! $DISPLAY && $XDG_VTNR -eq 2 ]]; then
  startx
fi
