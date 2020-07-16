#!/usr/bin/env bash

pkgs=$(pacman -Qu | wc -l)
glyph='  '

if [ $pkgs -eq 0 ]; then
  echo "$glyph Up to date"
else
  echo "$glyph $pkgs "
fi
