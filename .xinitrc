setxkbmap -option ctrl:nocaps  # CapsLock (keep pressed)    => Ctrl
xcape -e "Control_L=Escape"    # Ctrl/CapsLock (press once) => Escape
xbindkeys                      # Bind function keys.

xrandr --dpi 192           # HiDPI.
xrdb -merge ~/.Xresources  # Load Xresources configuration.

xss-lock -- i3lock -n -e -c 000000 &  # Automatically lock the screen.
xbanish &                             # Hide the mouse pointer when typing.

# Start SSH agent (only if it's not running already):
if ! pidof -x ssh-agent > /dev/null; then
  eval $(ssh-agent)
fi

# Pick a random wallpaper:
feh --recursive --randomize --bg-fill --no-fehbg ~/wallpapers

# Start the i3 window manager:
exec i3
