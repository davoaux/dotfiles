#!/bin/sh

setxkbmap us

# Set left pointer as the default cursor
# xsetroot -cursor_name left_ptr

# Auto hide the mouse pointer
# unclutter --timeout 2 --jitter 3 --exclude-root &

# dunst &

$HOME/.fehbg &
# xsetroot -solid "#525252"

xinput --set-prop 'Kingsis Peripherals ZOWIE Gaming mouse' 'libinput Accel Speed' -0.2 &
xinput --set-prop 'Kingsis Peripherals ZOWIE Gaming mouse' 'libinput Accel Profile Enabled' 0, 1 &
xrandr --output DVI-D-0 --mode 1920x1080 --rate 144.00 &

exec i3
# exec 2bwm
