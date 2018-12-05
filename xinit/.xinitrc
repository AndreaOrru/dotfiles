xrdb -merge ~/.Xresources

xset r rate 200 60
setxkbmap -option ctrl:nocaps
xcape

xss-lock -- i3lock -nec 999999 &
xbanish -b -s -t 3000
redshift &

compton -b
exec awesome
