#!/bin/sh

setxkbmap us

# Set left pointer as the default cursor
xsetroot -cursor_name left_ptr

# Auto hide the mouse pointer
unclutter --timeout 2 --jitter 3 --exclude-root &

# Set wallpaper
# $HOME/.fehbg &
xsetroot -solid "#9a9a9a"

# Mouse settings
$HOME/scripts/mssets.sh &

dunst &

exec i3
# exec 2bwm
