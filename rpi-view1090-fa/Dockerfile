FROM multiarch/alpine:armhf-latest-stable

RUN apk add --no-cache libusb ncurses git build-base libusb-dev ncurses-dev && \
    git clone https://github.com/flightaware/dump1090.git /tmp/dump1090 && \
    cd /tmp/dump1090 && \
    make view1090 BLADERF=no RTLSDR=no && \
    cp -a view1090 /usr/bin && \
    cd / && rm -r /tmp/dump1090 && \
    apk del git build-base libusb-dev ncurses-dev

ENTRYPOINT ["/usr/bin/view1090"]