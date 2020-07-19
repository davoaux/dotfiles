#!/usr/bin/env bash

xinput --set-prop 12 'libinput Accel Speed' -0.191177 &
xinput --set-prop 12 'libinput Accel Profile Enabled' 0, 1 &
xrandr --output DVI-D-0 --mode 1920x1080 --rate 144.00 &
