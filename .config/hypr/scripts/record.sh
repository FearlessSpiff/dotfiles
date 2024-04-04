#!/bin/env bash

wf-recorder_check() {
	if pgrep -x "wf-recorder" > /dev/null; then
			pkill -INT -x wf-recorder
			notify-send "Stopping all instances of wf-recorder" "$(cat /tmp/recording.txt)"
			wl-copy < "$(cat /tmp/recording.txt)"
			exit 0
	fi
}

wf-recorder_check

EXTERNAL_DISPLAY=$(hyprctl monitors all | grep '(ID 1)' | grep -oP 'DP-(\d)')
SELECTION=$(echo -e "screenshot selection\nscreenshot internal display\nscreenshot external display\nscreenshot both displays\nrecord selection\nrecord internal display\nrecord external display" | wofi --dmenu)
IMG="${HOME}/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%m-%s).png"
VID="${HOME}/Videos/Recordings/$(date +%Y-%m-%d_%H-%m-%s).mp4"


case "$SELECTION" in
	"screenshot selection")
		grim -g "$(slurp)" "$IMG"
		wl-copy < "$IMG"
		notify-send "Screenshot Taken" "${IMG}"
		;;
	"screenshot internal display")
		grim -c -o eDP-1 "$IMG"
		wl-copy < "$IMG"
		notify-send "Screenshot Taken" "${IMG}"
		;;
	"screenshot external display")
		grim -c -o $EXTERNAL_DISPLAY "$IMG"
		wl-copy < "$IMG"
		notify-send "Screenshot Taken" "${IMG}"
		;;
	"screenshot both displays")
		grim -c -o eDP-1 "${IMG//.png/-eDP-1.png}"
		grim -c -o $EXTERNAL_DISPLAY "${IMG//.png/-DP-2.png}"
		montage "${IMG//.png/-eDP-1.png}" "${IMG//.png/-DP-2.png}" -tile 2x1 -geometry +0+0 "$IMG" 
		wl-copy < "$IMG"
		rm "${IMG//.png/-eDP-1.png}" "${IMG/.png/-DP-2.png}"
		notify-send "Screenshot Taken" "${IMG}"
		;;
	"record selection")
		echo "$VID" > /tmp/recording.txt
		wf-recorder -c h264_vaapi -a alsa_output.pci-0000_00_1f.3.analog-stereo.monitor -g "$(slurp)" -f "$VID" &>/dev/null
		notify-send "Recording to " "${VID}"
		;;
	"record internal display")
		echo "$VID" > /tmp/recording.txt
		wf-recorder -c h264_vaapi -a alsa_output.pci-0000_00_1f.3.analog-stereo.monitor -o eDP-1 -f "$VID" &>/dev/null
		notify-send "Recording to " "${VID}"
		;;
	"record external display")
		echo "$VID" > /tmp/recording.txt
 		wf-recorder -c h264_vaapi -a alsa_output.pci-0000_00_1f.3.analog-stereo.monitor -o $EXTERNAL_DISPLAY -f "$VID" &>/dev/null
		notify-send "Recording to " "${VID}"
	;;
"record both screens")
	notify-send "recording both screens is not functional"
	;;
*)
	;;
esac
