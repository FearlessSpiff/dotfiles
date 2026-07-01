#!/bin/bash
if pgrep -x wvkbd-deskintl >/dev/null; then
  killall wvkbd-deskintl
else
  niri msg action spawn -- wvkbd-deskintl -L 300
fi
