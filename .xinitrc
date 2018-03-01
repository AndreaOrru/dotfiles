setxkbmap -option ctrl:nocaps
xcape -e "Control_L=Escape"
xbindkeys

xrandr --dpi 192
xrdb -merge ~/.Xresources

xbanish &
xss-lock -- i3lock -n -e -c 000000 &

feh --recursive --randomize --bg-fill --no-fehbg ~/wallpapers &

eval $(ssh-agent)
exec i3
eval $(ssh-agent -k)
