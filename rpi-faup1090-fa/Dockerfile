FROM multiarch/alpine:armhf-latest-stable

RUN apk add --no-cache libusb socat ncurses git build-base libusb-dev ncurses-dev && \
    git clone https://github.com/flightaware/dump1090.git /tmp/dump1090 && \
    cd /tmp/dump1090 && \
    make faup1090 BLADERF=no RTLSDR=no && \
    cp -a faup1090 /usr/local/bin && \
    cd / && rm -r /tmp/dump1090 && \
    find /usr/local/bin -type f -exec strip -p --strip-debug {} \; && \
    apk del git build-base libusb-dev ncurses-dev

COPY start.sh /
RUN  chmod u+x /start.sh

ENV PORT=10001

EXPOSE ${PORT}

ENTRYPOINT ["./start.sh"]