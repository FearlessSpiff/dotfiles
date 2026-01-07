#!/bin/zsh
case $1 in
inc)
  wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+
  ;;
dec)
  wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-
  ;;
mutetoggle)
  wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
  ;;
esac

muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -Eo "MUTED")
volDec=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -Eo "[0-9]+.[0-9]+")
volPerc=$((100 * volDec))

if [[ "$muted" == "MUTED" ]]; then
  dunstify -t 2000 -r 666 'Volume [off]'
else
  dunstify -t 2000 -r 666 'Volume' -i audio-volume-high -h int:value:${volPerc%.*}
fi
