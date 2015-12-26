# rpi-rtl-sdr
Raspberry PI Docker build file for Software Defined Radio tools. http://sdr.osmocom.org/trac/wiki/rtl-sdr

# Building

Clone the source into a folder and run:

```docker build -t myuser/rpi-rtlsdr --rm=true .```

# Usage

Run an rtl-sdr tool from the container such as:

```docker run -d -p 1234:1234 --privileged --name rtl_tcp myuser/rtl-sdr rtl_tcp -a 0.0.0.0```
