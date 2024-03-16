#!/bin/bash

# "on-click": "killall -34 wvkbd-mobintl",

SB_PID="$(pgrep -f '/usr/bin/squeekboard')"

if [[ -n $SB_PID ]]; then
	killall squeekboard
  printf '󰌐';
else
	/usr/bin/squeekboard &
  printf '󰌌';
fi
~/.config/hypr/waybar/scripts/leftbar-update.sh
