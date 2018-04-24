xrandr --dpi 192           # HiDPI.
xrdb -merge ~/.Xresources  # Load Xresources configuration.

desk &       # Setup dual-monitor, keyboard remappings.
xbindkeys &  # Bind function keys.
xbanish &    # Hide the mouse pointer when typing.

# Automatically lock the screen:
xss-lock -- lock &

# Start the i3 window manager:
exec i3
