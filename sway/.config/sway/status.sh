#!/usr/bin/env bash

print_hdd_used() {
  printf "hdd: %s" $(df -h --total --output=pcent | tail -n1 | xargs)
}

print_volume() {
  vol=$(wpctl get-volume @DEFAULT_SINK@)
  if grep -q MUTED <<< "$vol"; then
    printf "vol: muted"
  else
    awk '{ printf "vol: %d%%", $2 * 100 }' <<< "$vol"
  fi
}

print_date() {
  date +'%Y-%m-%d %X'
}

while printf "%s  %s  %s\n" "$(print_hdd_used)" "$(print_volume)" "$(print_date)"; do sleep 1; done
