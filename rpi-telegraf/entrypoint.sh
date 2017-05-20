#!/bin/sh
if [ "${1:0:1}" = '-' ]; then
    set -- telegraf "$@"
fi

exec "$@"