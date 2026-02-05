#!/bin/bash

WVKBD_PID="$(pgrep -f '.*wvkbd-deskintl.*')"

if [[ -n $WVKBD_PID ]]; then
  killall wvkbd-deskintl
else
  /usr/bin/wvkbd-deskintl -L 300 &
fi
