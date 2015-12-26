#! /bin/sh

set -e

cd /root

# Update configuration using environment variables
if [ -n "$MYCALL" ]; then
  sed -i 's|^MYCALL.*$|MYCALL '"$MYCALL"'|g' direwolf.conf
fi

if [ -n "$IGSERVER" ]; then
  sed -i 's|^IGSERVER.*$|IGSERVER '"$IGSERVER"'|g' direwolf.conf
fi

if [ -n "$IGLOGIN" ]; then
  sed -i 's|^#IGLOGIN.*$|IGLOGIN '"$IGLOGIN"'|g' direwolf.conf
fi

# Start Direwolf
rtl_fm -f 144.39M -g 50 - | direwolf -n 1 -r 24000 -t 0 -D 1 -
