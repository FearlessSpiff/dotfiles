#!/usr/bin/env bash

choice=$(printf " Cancel\n Lock\n󰈇 Logout\n Suspend\n Reboot\n Reboot to Windows\n Shutdown\nLock\nNolock" | wofi --dmenu)
if [[ $choice == " Lock" ]]; then
  loginctl lock-session
elif [[ $choice == "󰈇 Logout" ]]; then
  pkill -KILL -u "$USER"
elif [[ $choice == " Suspend" ]]; then
  systemctl suspend
elif [[ $choice == " Reboot" ]]; then
  systemctl reboot
elif [[ $choice == " Reboot to Windows" ]]; then
  systemctl reboot --boot-loader-entry=auto-windows
elif [[ $choice == " Shutdown" ]]; then
  systemctl poweroff
elif [[ $choice == "Lock" ]]; then
  ~/.config/hypr/scripts/lock-style.sh secure
elif [[ $choice == "Nolock" ]]; then
  ~/.config/hypr/scripts/lock-style.sh unsecure
fi
