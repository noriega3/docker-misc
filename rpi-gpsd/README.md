# rpi-gpsd
GPS Daemon for Raspberry PI running on Alpine Linux with support for PPS

gpsd is a service daemon that monitors one or more GPSes or AIS receivers attached to a host computer through serial or USB ports, making all data on the location/course/velocity of the sensors available to be queried on TCP port 2947 of the host computer. With gpsd, multiple location-aware client applications (such as navigational and wardriving software) can share access to receivers without contention or loss of data. Also, gpsd responds to queries with a format that is substantially easier to parse than the NMEA 0183 emitted by most GPSes. The gpsd distribution includes a linkable C service library, a C++ wrapper class, and a Python module that developers of gpsd-aware applications can use to encapsulate all communication with gpsd. Third-party client bindings for Java and Perl also exist.

http://www.catb.org/gpsd/

https://pkgs.alpinelinux.org/package/v3.5/main/armhf/gpsd

Example:

```
docker run -t -i --name=gpsd \
  -p 2947:2947 \
  --device=/dev/ttyS0:/dev/ttyAMA0 \
  bradsjm/rpi-gpsd /dev/ttyAMA0
```
