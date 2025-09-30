#!/bin/bash

WAYBAR_PID="$(pgrep -f '.*waybar/(left|top).*')"
if [[ -n $WAYBAR_PID ]]; then
  killall waybar
else
  /usr/bin/waybar -c ~/.config/hypr/waybar/top-niri/waybar-conf.json -s ~/.config/hypr/waybar/top-niri/style.css &
fi
