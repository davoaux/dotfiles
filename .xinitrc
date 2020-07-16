#!/bin/sh

setxkbmap es
xsetroot -cursor_name left_ptr
$HOME/.fehbg &
$HOME/scripts/mssets &
picom --experimental-backends --config $HOME/.config/picom/picom.conf &
dunst &
#sxhkd &

#exec i3
exec 2bwm
