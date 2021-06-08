#!/bin/sh

setxkbmap us

# Set left pointer as the default cursor
xsetroot -cursor_name left_ptr

# Auto hide the mouse pointer
unclutter --timeout 2 --jitter 3 --exclude-root &

$HOME/.fehbg &
# xsetroot -solid "#525252"

xinput --set-prop 12 'libinput Accel Speed' -0.191177 &
xinput --set-prop 12 'libinput Accel Profile Enabled' 0, 1 &
xrandr --output DVI-D-0 --mode 1920x1080 --rate 144.00 &

dunst &

exec i3
# exec 2bwm
