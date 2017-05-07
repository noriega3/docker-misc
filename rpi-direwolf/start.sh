#! /bin/sh
cd /root

# Update configuration using environment variables
if [ -n "$MYCALL" ]; then
  sed -i 's|^MYCALL.*$|MYCALL '"$MYCALL"'|g' sdr.conf
fi

if [ -n "$IGSERVER" ]; then
  sed -i 's|^IGSERVER.*$|IGSERVER '"$IGSERVER"'|g' sdr.conf
fi

if [ -n "$IGLOGIN" ]; then
  sed -i 's|^#IGLOGIN.*$|IGLOGIN '"$IGLOGIN"'|g' sdr.conf
fi

# Start Direwolf
rtl_fm -f $FREQUENCY ${*} - | /usr/local/bin/direwolf -c sdr.conf -r 24000 -D 1 -a 100 -