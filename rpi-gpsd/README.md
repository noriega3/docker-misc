# rpi-gpsd
GPS Daemon for Raspberry PI running on Alpine Linux with support for PPS

http://www.catb.org/gpsd/

https://pkgs.alpinelinux.org/package/v3.5/main/armhf/gpsd

Example:

```
docker run -t -i --name=gpsd \
  -p 2947:2947 \
  --device=/dev/ttyS0:/dev/ttyAMA0 \
  bradsjm/rpi-gpsd /dev/ttyAMA0
```
