#!/usr/bin/env bash

print_volume() {
  printf "vol: %s" $(amixer get Master | awk -F '[][]' '/%/ { print $2; exit }')
}

print_date() {
  date +'%Y-%m-%d %X'
}

while printf "%s %s\n" "$(print_volume)" "$(print_date)"; do sleep 1; done
