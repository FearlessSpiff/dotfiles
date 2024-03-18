#!/bin/bash

SB_PID="$(pgrep -f '/usr/bin/squeekboard')"

if [[ -n $SB_PID ]]; then
	killall squeekboard
  notify-send '*disabled* squeekboard'
  printf '󰌐';
else
	/usr/bin/squeekboard &
  notify-send 'enabled squeekboard'
  printf '󰌌';
fi
sleep 1 && ~/.config/hypr/waybar/scripts/leftbar-update.sh
