#!/bin/sh
if [ -z "$*" ]; then
  /usr/local/bin/faup1090 --help
  exit
fi

echo "Listening for TCP connections on ${PORT}..."
exec /usr/bin/socat TCP-LISTEN:${PORT},fork EXEC:"/usr/local/bin/faup1090 --stdout $*"
