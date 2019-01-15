xrdb -merge ~/.Xresources

xset r rate 200 60
setxkbmap -option ctrl:nocaps
setxkbmap -option altwin:swap_lalt_lwin
xcape

xss-lock -- i3lock -nec 999999 &
xbanish -b -s -t 3000
redshift &

exec awesome
