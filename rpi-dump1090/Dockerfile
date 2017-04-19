FROM bradsjm/rpi-rtl-sdr:latest

RUN apk add --no-cache libusb git build-base libusb-dev && \
    git clone https://github.com/mutability/dump1090.git && \
    cd /dump1090 && \
    make dump1090 view1090 'EXTRACFLAGS=-DHTMLPATH=\"/usr/share/dump1090-mutability/html\"' && \
    mkdir -p /usr/share/dump1090-mutability/html && \
    cp -a public_html/* /usr/share/dump1090-mutability/html && \
    cp -a dump1090 view1090 /usr/bin && \
    cd / && rm -r /dump1090 && \
    apk del git build-base libusb-dev

EXPOSE 30001 30002 30003

ENTRYPOINT ["/usr/bin/dump1090"]
