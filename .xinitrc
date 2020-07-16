#!/bin/sh

setxkbmap es
xsetroot -cursor_name left_ptr
$HOME/.fehbg &
$HOME/scripts/mssets &
picom --experimental-backends --config $HOME/.config/picom/picom.conf &
dunst &

#exec i3

## Start window manager in the background. If it dies, X still lives
#2bwm &
## Start a terminal in the foreground. If this dies, X dies
#exec urxvt

exec 2bwm
