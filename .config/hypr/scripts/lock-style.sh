#!/bin/bash
case $1 in
secure)
  sed -i 's/# lock_cmd = hyprlock # unsecure/lock_cmd = hyprlock # secure/g' ~/.config/hypr/hypridle.conf
  notify-send "Changed to secure lock style"
	;;
unsecure)
  sed -i 's/lock_cmd = hyprlock # secure/# lock_cmd = hyprlock # unsecure/g' ~/.config/hypr/hypridle.conf
  notify-send -u critical "Changed to unsecure lock style"
	;;
esac
killall hypridle
hypridle &
