#!/bin/sh

set -o errexit         # Exit on most errors (see the manual)
set -o xtrace          # Trace the execution of the script (debug)

CMD="/usr/local/bin/rtl_433 -q -U -F json $@"
exec /usr/bin/socat TCP-LISTEN:${PORT:-9433},reuseaddr,fork SYSTEM:"${CMD}",pty