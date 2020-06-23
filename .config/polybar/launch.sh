#!/usr/bin/env bash

killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep1; done

#polybar bar1 -c /home/parelkobra/.config/polybar/bars/gruvbox_dark_2.ini &
polybar bar1 -c /home/parelkobra/.config/polybar/bars/monospace_minimal.ini &
