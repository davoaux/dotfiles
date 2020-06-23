#!/bin/sh

setxkbmap es
$HOME/.fehbg &
$HOME/scripts/mssets &
picom --experimental-backends --config $HOME/.config/picom/picom.conf &
dunst &

exec i3
