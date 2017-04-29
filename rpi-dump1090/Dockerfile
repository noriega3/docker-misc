FROM bradsjm/rpi-rtl-sdr:latest

WORKDIR /tmp

RUN apk add --no-cache libusb git build-base libusb-dev && \
    git clone https://github.com/mutability/dump1090.git && \
    cd /tmp/dump1090 && \
    make dump1090 && \
    mkdir -p /usr/share/dump1090-mutability/html && \
    cp -a dump1090 /usr/bin && \
    cd / && rm -r /tmp/dump1090 && \
    apk del git build-base libusb-dev

EXPOSE 30001 30002 30003 30004 30005 30104

ENTRYPOINT ["/usr/bin/dump1090"]