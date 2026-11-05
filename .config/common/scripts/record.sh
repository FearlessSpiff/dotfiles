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

# internal panel is eDP-* or DSI-*, everything else counts as external
INTERNAL_DISPLAY=$(niri msg --json outputs | jq -r 'keys[] | select(test("^(eDP|DSI)-"))' | head -n1)
EXTERNAL_DISPLAY=$(niri msg --json outputs | jq -r 'keys[] | select(test("^(eDP|DSI)-") | not)' | head -n1)
SELECTION=$(echo -e "screenshot selection\nscreenshot window\nscreenshot display\nscreenshot both displays\nrecord selection\nrecord internal display\nrecord external display" | wofi --dmenu)
IMG="${HOME}/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png"
VID="${HOME}/Videos/Recordings/$(date +%Y-%m-%d_%H-%M-%S).mp4"

# find alsa device: pw-cli list-objects | grep node.name
AUDIO_DEVICE="alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__Speaker__sink"

case "$SELECTION" in
"screenshot selection")
  hyprshot -m region -o $IMG
  ;;
"screenshot window")
  hyprshot -m window -o $IMG
  ;;
"record selection")
  echo "$VID" >/tmp/recording.txt
  wf-recorder -c h264_vaapi -a $AUDIO_DEVICE -g "$(slurp)" -f "$VID" &>/dev/null
  notify-send "Recording to " "${VID}"
  ;;
"record internal display")
  echo "$VID" >/tmp/recording.txt
  wf-recorder -c h264_vaapi -a $AUDIO_DEVICE -o eDP-1 -f "$VID" &>/dev/null
  notify-send "Recording to " "${VID}"
  ;;
"record external display")
  echo "$VID" >/tmp/recording.txt
  wf-recorder -c h264_vaapi -a $AUDIO_DEVICE -o $EXTERNAL_DISPLAY -f "$VID" &>/dev/null
  notify-send "Recording to " "${VID}"
  ;;
"record both screens")
  notify-send "recording both screens is not functional"
  ;;
*) ;;
esac
