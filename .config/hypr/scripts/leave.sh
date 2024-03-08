#!/usr/bin/env bash

choice=$(printf " Cancel\n Lock\n󰈇 Logout\n Suspend\n Reboot\n Shutdown" | wofi --dmenu)
if [[ $choice == " Lock" ]];then
    loginctl lock-session
elif [[ $choice == "󰈇 Logout" ]];then
    pkill -KILL -u "$USER"
elif [[ $choice == " Suspend" ]];then
    systemctl suspend
elif [[ $choice == " Reboot" ]];then
    systemctl reboot
elif [[ $choice == " Shutdown" ]];then
    systemctl poweroff
fi

