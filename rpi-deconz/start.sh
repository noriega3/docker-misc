#!/bin/sh
Xvnc -rfbauth=/root/.vnc/passwd -geometry 1024x768 :1 &
x-window-manager &
exec deCONZ --auto-connect=1 --http-port=80
