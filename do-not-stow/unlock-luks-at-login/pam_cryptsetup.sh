#!/bin/sh

CRYPT_USER="steph"
PARTITION="/dev/mmcblk0p1"
NAME="home-$CRYPT_USER"

if [ "$PAM_USER" = "$CRYPT_USER" ] && [ ! -e "/dev/mapper/$NAME" ]; then
    /usr/bin/cryptsetup open "$PARTITION" "$NAME"
fi
