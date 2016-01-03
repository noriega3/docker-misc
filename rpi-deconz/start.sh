#!/bin/sh

# Start Xvnc server, no password localhost only
rm -f /tmp/.X*-lock
Xvnc -SecurityTypes=None -localhost -screen 0 1024x768x16 &

# Generate RSA keys and start rdp server (uses vnc server)
xrdp-keygen xrdp /etc/xrdp/rsakeys.ini && xrdp

# Start window manager
export DISPLAY=:0
x-window-manager &

# Reset Zigbee module
GCFFlasher -r

# Download updates
deCONZ-update.sh

# Start deCONZ
exec deCONZ-autostart.sh
