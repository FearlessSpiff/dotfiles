#!/bin/bash

IS_DARK_MODE="$(grep style-dark.css ~/.config/hypr/waybar/scripts/topbar-toggle.sh)"

echo IS_DARK_MODE
if [[ -n $IS_DARK_MODE ]]; then
	hyprctl hyprpaper unload all
  hyprctl hyprpaper preload ~/.config/hypr/wallpaper/clouds.jpeg
  hyprctl hyprpaper wallpaper "desc:LG Electronics LG TV SSCR2 0x01010101,~/.config/hypr/wallpaper/clouds.jpeg"
  hyprctl hyprpaper wallpaper "eDP-1,~/.config/hypr/wallpaper/clouds.jpeg"
  sed -i 's/style-dark.css/style.css/g' ~/.config/hypr/waybar/scripts/topbar-toggle.sh 
  sed -i 's/style-dark.css/style.css/g' ~/.config/hypr/waybar/scripts/leftbar-toggle.sh 
else
	hyprctl hyprpaper unload all
  hyprctl hyprpaper preload ~/.config/hypr/wallpaper/black-skull.jpeg
  hyprctl hyprpaper wallpaper "desc:LG Electronics LG TV SSCR2 0x01010101,~/.config/hypr/wallpaper/black-skull.jpeg"
  hyprctl hyprpaper wallpaper "eDP-1,~/.config/hypr/wallpaper/black-skull.jpeg"
  sed -i 's/style.css/style-dark.css/g' ~/.config/hypr/waybar/scripts/topbar-toggle.sh 
  sed -i 's/style.css/style-dark.css/g' ~/.config/hypr/waybar/scripts/leftbar-toggle.sh 
fi

killall waybar
~/.config/hypr/waybar/scripts/topbar-toggle.sh  
