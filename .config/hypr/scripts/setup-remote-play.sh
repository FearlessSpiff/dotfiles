#!/bin/bash
hyprctl output create headless SUNSHINE
hyprctl keyword monitor SUNSHINE,2560x1440@120,auto,auto
sleep 3
systemctl --user start sunshine.service
