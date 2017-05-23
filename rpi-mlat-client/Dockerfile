FROM resin/armhf-alpine:latest

RUN apk add --no-cache git build-base python3 python3-dev && \
    git clone https://github.com/mutability/mlat-client.git /tmp/mlat-client && \
    cd /tmp/mlat-client && \
    ./setup.py install && \
    cd / && rm -r /tmp/mlat-client && \
    apk del git build-base python3-dev

ENTRYPOINT ["/usr/bin/mlat-client"]
