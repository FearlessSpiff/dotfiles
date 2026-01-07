#!/bin/bash
sed -Ei 's/^[[:blank:]]*monitor = eDP-1, disable/#&/;t;s/^#([[:blank:]]*monitor = eDP-1, disable)/\1/' ~/.config/hypr/hyprland.conf
