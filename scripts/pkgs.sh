#!/usr/bin/env bash

pkgs=$(pacman -Qu | wc -l)
glyph='  '

[ $pkgs -eq 0 ] && 
  echo "$glyph Up to date" ||
  echo "$glyph $pkgs "
