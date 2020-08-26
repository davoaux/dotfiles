#!/bin/sh

setxkbmap us
xsetroot -cursor_name left_ptr
unclutter --timeout 2 --jitter 3 --exclude-root &
$HOME/.fehbg &
$HOME/scripts/mssets.sh &
$HOME/scripts/curlock.sh &
#$HOME/scripts/bar.sh
picom --experimental-backends --config $HOME/.config/picom/picom.conf &
dunst &

#while true; do
#	xsetroot -name "$(date "+%b %d %Y | %H:%M")"
#	sleep 1m
#done &

exec i3
#exec 2bwm
#exec dwm
