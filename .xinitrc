#!/bin/sh

setxkbmap us

# Set left pointer as the default cursor
xsetroot -cursor_name left_ptr

# Auto hide the mouse pointer
unclutter --timeout 2 --jitter 3 --exclude-root &

# Set wallpaper
$HOME/.fehbg &

# Mouse settings
$HOME/scripts/mssets.sh &

picom --experimental-backends --config $HOME/.config/picom/picom.conf &
dunst &

exec i3
#exec 2bwm
#exec dwm
