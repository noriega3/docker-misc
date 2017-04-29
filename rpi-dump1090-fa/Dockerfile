FROM bradsjm/rpi-rtl-sdr:latest

RUN apk add --no-cache libusb ncurses git build-base libusb-dev ncurses-dev && \
    git clone https://github.com/flightaware/dump1090.git && \
    cd /dump1090 && \
    make dump1090 BLADERF=no && \
    cp -a dump1090 /usr/bin && \
    cd / && rm -r /dump1090 && \
    apk del git build-base libusb-dev ncurses-dev

EXPOSE 30001 30002 30003 30004 30005 30104

ENTRYPOINT ["/usr/bin/dump1090"]
