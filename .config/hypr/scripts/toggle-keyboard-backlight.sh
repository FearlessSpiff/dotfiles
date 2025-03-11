#!/bin/bash

if brightnessctl --device='platform::kbd_backlight' info | grep -q 100%; then
  brightnessctl --device='platform::kbd_backlight' set 0
else
  brightnessctl --device='platform::kbd_backlight' set +1
fi
