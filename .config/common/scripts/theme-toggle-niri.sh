#!/bin/bash

IS_DARK_MODE="$(grep style-dark.css ~/.config/hypr/waybar/scripts/topbar-toggle.sh)"

echo IS_DARK_MODE
if [[ -n $IS_DARK_MODE ]]; then
  sed -i 's/black-skull.jpeg/clouds.jpeg/g' ~/.config/hypr/hyprpaper.conf
  sed -i 's/style-dark.css/style.css/g' ~/.config/hypr/waybar/scripts/topbar-toggle.sh
  sed -i 's/style-dark.css/style.css/g' ~/.config/hypr/waybar/scripts/leftbar-toggle.sh
else
  sed -i 's/clouds.jpeg/black-skull.jpeg/g' ~/.config/hypr/hyprpaper.conf
  sed -i 's/style.css/style-dark.css/g' ~/.config/hypr/waybar/scripts/topbar-toggle.sh
  sed -i 's/style.css/style-dark.css/g' ~/.config/hypr/waybar/scripts/leftbar-toggle.sh
fi

killall waybar
~/.config/hypr/waybar/scripts/topbar-toggle.sh

killall --wait hyprpaper
hyprpaper &
