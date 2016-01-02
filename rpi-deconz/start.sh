#!/bin/sh
PASS=${PASS:-"deconz"}
echo $PASS | vncpasswd -f > /root/.vncpasswd
Xtightvnc -rfbauth /root/.vncpasswd -geometry 1024x768 -depth 24 :1 &
x-window-manager &
exec deCONZ --auto-connect=1 --http-port=80
