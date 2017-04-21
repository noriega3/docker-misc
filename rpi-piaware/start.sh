#!/bin/sh

if [ -z "${USER}" ]; then
  echo "USER environment variable not set"
  exit 1
fi

if [ -z "${PASSWORD}" ]; then
  echo "PASSWORD environment variable not set"
  exit 1
fi

if [ -s "${GPSD}" ]; then
    socat -s TCP-LISTEN:2947,fork TCP:${GPSD}:2947 &
fi

piaware-config flightaware-user ${USER}
piaware-config flightaware-password ${PASSWORD}
exec /usr/bin/piaware -debug $*