#!/usr/bin/env bash

case $1 in
  g) output='';;
  *) output='';;
esac

pkgs=$(pacman -Qu | wc -l)
output="$output $pkgs"

[ $pkgs -eq 0 ] && echo " Up to date" || echo "$output"
