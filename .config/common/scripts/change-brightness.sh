#!/bin/zsh
case $1 in
inc)
  out=$(brightnessctl -m --class=backlight set +10%)
  ;;
dec)
  out=$(brightnessctl -m --class=backlight set 10%-)
  ;;
esac

#echo "$out"
array=(${(s:,:)out})
brightnessPct=$array[4]
echo "$brightnessPct"
if [[ "$brightnessPct" == "0%" ]]; then
    brightnessPct="1%"
    brightnessctl --class=backlight set 1%
fi
dunstify -r 667 -t 2000 'Brightness' -h int:value:${brightnessPct}
