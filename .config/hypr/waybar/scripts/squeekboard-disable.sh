#!/bin/bash

# "on-click": "killall -34 wvkbd-mobintl",

SB_PID="$(pgrep -f '/usr/bin/squeekboard')"

if [[ -n $SB_PID ]]; then
	killall squeekboard
else
  echo 'nothing running that could be closed'
fi
