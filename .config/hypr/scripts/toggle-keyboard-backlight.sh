#!/bin/bash

if brightnessctl --device='platform::kbd_backlight' info | grep -q 100%; then
  dms ipc call brightness set 0 leds:platform::kbd_backlight
else
  dms ipc call brightness increment 51 leds:platform::kbd_backlight
fi
