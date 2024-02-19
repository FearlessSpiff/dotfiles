#!/bin/bash

LEFTBAR_PID="$(pgrep -f '.*waybar/left.*')"

if [[ -n $LEFTBAR_PID ]]; then
  kill -s SIGTERM $LEFTBAR_PID
else
  /usr/bin/waybar -c ~/.config/hypr/waybar/left/waybar-conf.json -s ~/.config/hypr/waybar/left/style.css &
fi