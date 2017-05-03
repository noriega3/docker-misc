# rpi-faup1090-fa
This is a Alpine Linux based build of faup1090 from the FlightAware Dump1090 fork from https://github.com/flightaware/dump1090

It uses socat to expose faup1090 process on port 10001.

Example:
```
docker run -p 10001:10001 bradsjm/rpi-faup1090-fa
```

---
https://github.com/bradsjm/Dockerfiles/tree/master/rpi-dump1090-fa
