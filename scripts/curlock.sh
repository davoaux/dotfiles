#!/usr/bin/env bash
#
# Update lock screen bg to match current wallpaper

wp=`cat ~/.fehbg`
wp=${wp#*\'}
wp=${wp%\'}

betterlockscreen -u $wp >/dev/null
