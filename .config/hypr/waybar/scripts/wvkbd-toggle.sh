#!/bin/bash

# "on-click": "killall -34 wvkbd-mobintl",

WVKBD_PID="$(pgrep -f '.*wvkbd-desktop.*')"

if [[ -n $WVKBD_PID ]]; then
	killall wvkbd-desktop
else
	/usr/local/bin/wvkbd-desktop &
fi
