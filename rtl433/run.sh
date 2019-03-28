#!/bin/sh

set -o errexit         # Exit on most errors (see the manual)
set -o xtrace          # Trace the execution of the script (debug)

/usr/local/bin/rtl_433 $@ | socat STDIN TCP-LISTEN:${PORT:-9433},reuseaddr,fork
