#!/bin/sh

setxkbmap es
xsetroot -cursor_name left_ptr
unclutter --timeout 2 --jitter 15 --exclude-root &
$HOME/.fehbg &
$HOME/scripts/mssets.sh &
$HOME/scripts/curlock.sh &
picom --experimental-backends --config $HOME/.config/picom/picom.conf &
dunst &

#exec i3
exec 2bwm
