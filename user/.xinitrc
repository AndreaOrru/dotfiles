xrdb -merge ~/.Xresources

xrandr --output HDMI-A-1 --auto --primary \
       --output DisplayPort-2 --right-of HDMI-A-1 --auto --rotate left

xset r rate 200 60
setxkbmap -option ctrl:nocaps
xcape

xss-lock -- i3lock -nec 999999 &

exec awesome
