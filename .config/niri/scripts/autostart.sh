#!/bin/bash

alacritty &
# Wait until first-app process exists
while ! pgrep -x "alacritty" >/dev/null; do
  sleep 0.25
done

zen-browser &
