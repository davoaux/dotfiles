#!/bin/sh

setxkbmap es
$HOME/.fehbg &
$HOME/scripts/mssets &
picom --config $HOME/.config/picom/picom.conf &

exec i3
#exec dbus-launch --autolaunch=$(cat /var/lib/dbus/machine-id) i3
