#!/bin/env bash

wf-recorder_check() {
  if pgrep -x "wf-recorder" >/dev/null; then
    pkill -INT -x wf-recorder
    notify-send "Stopping all instances of wf-recorder" "$(cat /tmp/recording.txt)"
    wl-copy <"$(cat /tmp/recording.txt)"
    exit 0
  fi
}

wf-recorder_check

EXTERNAL_DISPLAY=$(hyprctl monitors all | grep '(ID 1)' | grep -oP 'DP-(\d)')
SELECTION=$(echo -e "screenshot selection\nscreenshot window\nscreenshot both displays\nrecord selection\nrecord internal display\nrecord external display" | wofi --dmenu)
IMG="${HOME}/Pictures/Screenshots"
VID="${HOME}/Videos/Recordings/$(date +%Y-%m-%d_%H-%m-%s).mp4"

case "$SELECTION" in
"screenshot selection")
  hyprshot -m region -o $IMG
  ;;
"screenshot window")
  hyprshot -m window -o $IMG
  ;;
"record selection")
  echo "$VID" >/tmp/recording.txt
  wf-recorder -c h264_vaapi -a alsa_output.pci-0000_00_1f.3.analog-stereo.monitor -g "$(slurp)" -f "$VID" &>/dev/null
  notify-send "Recording to " "${VID}"
  ;;
"record internal display")
  echo "$VID" >/tmp/recording.txt
  wf-recorder -c h264_vaapi -a alsa_output.pci-0000_00_1f.3.analog-stereo.monitor -o eDP-1 -f "$VID" &>/dev/null
  notify-send "Recording to " "${VID}"
  ;;
"record external display")
  echo "$VID" >/tmp/recording.txt
  wf-recorder -c h264_vaapi -a alsa_output.pci-0000_00_1f.3.analog-stereo.monitor -o $EXTERNAL_DISPLAY -f "$VID" &>/dev/null
  notify-send "Recording to " "${VID}"
  ;;
"record both screens")
  notify-send "recording both screens is not functional"
  ;;
*) ;;
esac
