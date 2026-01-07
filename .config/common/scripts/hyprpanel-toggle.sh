#!/bin/bash

GJS_PID="$(pgrep -f '.*gjs.*')"

if [[ -n $GJS_PID ]]; then
  killall gjs
else
  /usr/bin/hyprpanel
fi
