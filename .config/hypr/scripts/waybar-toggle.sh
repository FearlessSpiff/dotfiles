#!/bin/bash

WAYBAR_PID="$(pgrep -f '.*waybar/(left|top).*')"
if [[ -n $WAYBAR_PID ]]; then
	killall waybar
else
	/usr/bin/waybar -c ~/.config/hypr/waybar/top/waybar-conf.json -s ~/.config/hypr/waybar/top/style.css &
fi
