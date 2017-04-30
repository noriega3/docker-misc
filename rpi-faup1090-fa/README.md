# rpi-faup1090-fa
This is a Alpine Linux based build of faup1090 from the FlightAware Dump1090 fork from https://github.com/flightaware/dump1090

It uses socat to expose faup1090 process on port 30105.

Example:
```
docker run -p 30105:30105 bradsjm/rpi-faup1090-fa
```

---
https://github.com/bradsjm/Dockerfiles/tree/master/rpi-dump1090-fa
