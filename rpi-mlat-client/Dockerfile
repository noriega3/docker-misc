FROM hypriot/rpi-alpine:latest

RUN apk add --no-cache git build-base python3 netcat-openbsd python3-dev && \
    git clone https://github.com/mutability/mlat-client.git && \
    cd /mlat-client && \
    ./setup.py install && \
    cd / && rm -r /mlat-client && \
    apk del git build-base python3-dev

CMD ["/bin/ash"]
