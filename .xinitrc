setxkbmap -option ctrl:nocaps
xcape -e "Control_L=Escape"
xbindkeys

xrandr --dpi 192
xrdb -merge ~/.Xresources

xbanish &
xss-lock -- slock &
nm-applet --sm-disable &

feh --recursive --randomize --bg-fill --no-fehbg ~/wallpapers &
eval $(ssh-agent)
/usr/bin/emacs --daemon &

exec awesome
