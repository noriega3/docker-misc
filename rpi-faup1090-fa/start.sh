#!/bin/sh
if [ -z "$*" ]; then
  /usr/bin/faup1090 --help
  exit
fi

echo "Listening for TCP connections on ${PORT}..."
exec /usr/bin/socat TCP-LISTEN:${PORT},fork EXEC:"/usr/bin/faup1090 --stdout $*"
