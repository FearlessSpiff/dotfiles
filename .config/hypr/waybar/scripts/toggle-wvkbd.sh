#!/bin/bash

# "on-click": "killall -34 wvkbd-mobintl",

WVKBD_PID="$(pgrep -f '.*wvkbd-mobintl.*')"

if [[ -n $WVKBD_PID ]]; then
  killall wvkbd-mobintl
else
  /usr/bin/wvkbd-mobintl -L 280 &
fi