#!/bin/zsh
case $1 in
inc)
  wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+
  ;;
dec)
  wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-
  ;;
esac

volDec=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -Eo "[0-9]+.[0-9]+")
volPerc=$((100 * volDec))

dunstify -t 2000 'Volume' -h int:value:${volPerc%.*}
