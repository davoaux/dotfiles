#!/usr/bin/env bash

# Active workspaces
active_ws=`wmctrl -l | awk '{print $2}'`

# Current workspace
current_ws=`xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}'`

while [[ $# -gt 0 ]]; do
  case $1 in
    # Just print the current workspace
    -s)
      echo "$((++current_ws))"
      exit 0;
      ;;
    *)
      echo "Unknown argument: $1"
      exit 1
      ;;
  esac
done

for i in {0..4}; do
  ws=$i; ((ws++))
  if [ $current_ws == $i ]; then
    printf ' %s ' "$ws"
  elif [[ $active_ws == *$i* ]]; then
    printf ' %s ' "$ws"
  else
    printf ""
  fi
done
