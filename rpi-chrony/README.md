# rpi-chrony
chrony is a versatile implementation of the Network Time Protocol (NTP). It can synchronize the system clock with NTP servers, reference clocks (e.g. GPS receiver), and manual input using wristwatch and keyboard. It can also operate as an NTPv4 (RFC 5905) server and peer to provide a time service to other computers in the network.

https://chrony.tuxfamily.org/

https://pkgs.alpinelinux.org/package/v3.5/main/armhf/chrony

Example:

```
docker run -t -i --name=gpsd \
  -p 123:123/udp \
  --cap-add SYS_TIME \
  --ipc container:gpsd \
  --device=/dev/pps0:/dev/pps0 \
  bradsjm/rpi-chrony
```
