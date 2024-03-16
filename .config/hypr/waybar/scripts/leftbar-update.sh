#!/bin/bash

LEFTBAR_PID="$(pgrep -f '.*waybar/left.*')"

if [[ -n $LEFTBAR_PID ]]; then
	kill -37  $LEFTBAR_PID
fi
