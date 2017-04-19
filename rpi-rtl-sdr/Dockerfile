FROM hypriot/rpi-alpine:latest

RUN apk add --no-cache libusb git build-base cmake libusb-dev && \
    git clone git://git.osmocom.org/rtl-sdr.git && \
    mkdir /rtl-sdr/build && cd /rtl-sdr/build && \
    cmake ../ -DINSTALL_UDEV_RULES=ON -DDETACH_KERNEL_DRIVER=ON && make && make install ; \
    cd / && rm -r /rtl-sdr && \
    apk del git build-base cmake libusb-dev

CMD ["/bin/ash"]
