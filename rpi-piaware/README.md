# rpi-piaware

Client-side package and programs for forwarding ADS-B data to FlightAware.

This is a Raspbian based build of https://github.com/flightaware/piaware.
It will connect to the dump1090 container and provide MLAT results on port 30105.

- You should set a fixed MAC address as FlightAware uses this to identify you
- You can pass in your FlightAware user and password using environment variables
- You can specify (if known) your FEEDID using an environment variable
- You can specify a GPSD instance to connect to (for MLAT) using the environment variable GPSD

Example:
```
docker run -t -i -p 30105:30105 \
  --link dump1090 \
  --mac-address="xx:xx:xx:xx:xx:xx"
  -e USER=user \
  -e PASSWORD=password \
  -e FEEDID=xxxxxx \
  -e GPSD=
  bradsjm/rpi-piaware
```
