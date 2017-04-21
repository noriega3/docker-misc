#!/bin/sh

if [ -z "${USER}" ]; then
  echo "USER environment variable not set"
  exit 1
fi

if [ -z "${PASSWORD}" ]; then
  echo "PASSWORD environment variable not set"
  exit 1
fi

if [ -n "${GPSD}" ]; then
    echo "Forwarding port 2947 to ${GPSD}"
    socat -s TCP-LISTEN:2947,fork TCP:${GPSD}:2947 &
fi

if [ -n "${FEEDID}" ]; then
    piaware-config feeder-id ${FEEDID}
fi

piaware-config flightaware-user ${USER}
piaware-config flightaware-password ${PASSWORD}

exec /usr/bin/piaware -debug $*