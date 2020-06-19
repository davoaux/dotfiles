#!/bin/sh

setxkbmap es
$HOME/.fehbg &
$HOME/scripts/mssets &
picom --config $HOME/.config/picom/picom.conf &
dunst &

exec i3
