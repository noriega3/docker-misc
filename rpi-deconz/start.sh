#!/bin/sh
PASS=${PASS:-"deconz"}
echo $PASS | vncpasswd -f > /root/.vncpasswd
Xvnc -rfbauth=/root/.vncpasswd -geometry 1024x768 :1 &
xsetroot -solid grey
x-window-manager &
exec deCONZ --auto-connect=1 --http-port=80
