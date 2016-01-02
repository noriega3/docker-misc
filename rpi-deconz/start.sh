#!/bin/sh
PASS=${PASS:-"delight"}
echo $PASS | vncpasswd -f > /root/.vncpasswd
rm -f /tmp/.X1-lock
Xtightvnc -rfbauth /root/.vncpasswd -geometry 1024x768 -depth 24 :1 &
x-window-manager &
GCFFlasher -r
exec deCONZ-autostart.sh
