#!/bin/bash

# "on-click": "killall -34 wvkbd-mobintl",

SB_PID="$(pgrep -f '/usr/bin/squeekboard')"

if [[ -n $SB_PID ]]; then
  printf '󰌌';
else
  printf '󰌐';
fi
