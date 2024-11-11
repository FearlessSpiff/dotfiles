#!/bin/bash

CURRENT_THEME_FILE=/tmp/current-theme.txt
if [ ! -f "$CURRENT_THEME_FILE" ]; then
  echo "LIGHT" >$CURRENT_THEME_FILE
fi

CURRENT_THEME= <Home >i
read CURRENT_THEME <$CURRENT_THEME_FILE

echo $CURRENT_THEME
if [[ "$CURRENT_THEME" == "DARK" ]]; then
  echo "true"
  hyprctl hyprpaper unload all
  hyprctl hyprpaper preload ~/.config/hypr/wallpaper/clouds.jpeg
  hyprctl hyprpaper wallpaper "desc:LG Electronics LG TV SSCR2 0x01010101,~/.config/hypr/wallpaper/clouds.jpeg"
  hyprctl hyprpaper wallpaper "eDP-1,~/.config/hypr/wallpaper/clouds.jpeg"
  echo "LIGHT" >$CURRENT_THEME_FILE
  ags -r "useTheme('/home/steph/.config/hyprpanel/dracula-theme.json')"
  echo "LIGHT" >$CURRENT_THEME_FILE
#  sed -i 's/style-dark.css/style.css/g' ~/.config/hypr/waybar/scripts/topbar-toggle.sh
#  sed -i 's/style-dark.css/style.css/g' ~/.config/hypr/waybar/scripts/leftbar-toggle.sh
else
  echo "false"
  hyprctl hyprpaper unload all
  hyprctl hyprpaper preload ~/.config/hypr/wallpaper/black-skull.jpeg
  hyprctl hyprpaper wallpaper "desc:LG Electronics LG TV SSCR2 0x01010101,~/.config/hypr/wallpaper/black-skull.jpeg"
  hyprctl hyprpaper wallpaper "eDP-1,~/.config/hypr/wallpaper/black-skull.jpeg"
  echo "DARK" >$CURRENT_THEME_FILE
  ags -r "useTheme('/home/steph/.config/ags/themes/monochrome.json')"
  echo "DARK" >$CURRENT_THEME_FILE
#  sed -i 's/style.css/style-dark.css/g' ~/.config/hypr/waybar/scripts/topbar-toggle.sh
#  sed -i 's/style.css/style-dark.css/g' ~/.config/hypr/waybar/scripts/leftbar-toggle.sh
fi

#killall waybar
#~/.config/hypr/waybar/scripts/topbar-toggle.sh
