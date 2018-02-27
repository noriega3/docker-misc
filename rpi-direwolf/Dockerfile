FROM bradsjm/rpi-rtl-sdr:latest

# Note: Run the image with the following options:
#	--device /dev/bus/usb:/dev/bus/usb

ENV MYCALL n0call
ENV IGSERVER noam.aprs2.net
ENV IGLOGIN n0call -1
ENV FREQUENCY 144.39M

EXPOSE 8000 8001

RUN apk add --no-cache git alsa-lib alsa-lib-dev linux-headers build-base && \
    git clone git://www.github.com/wb2osz/direwolf /tmp/direwolf && \
    echo "#include <unistd.h>" > /usr/include/sys/unistd.h && \
    cd /tmp/direwolf && \
    sed -i 's/--mode=/-m /g' Makefile.linux && \
    sed -i 's/cp -n/cp/g' Makefile.linux && \
    CFLAGS=-D__FreeBSD__ make && make install && \
    cd / && rm -r /tmp/direwolf /usr/include/sys/unistd.h && \
    find /usr/local/bin -type f -exec strip -p --strip-debug {} \; && \
    apk del git alsa-lib-dev linux-headers build-base

ADD sdr.conf /root/sdr.conf
ADD start.sh /root/start.sh
RUN chmod +x /root/start.sh
ENTRYPOINT ["/root/start.sh"]

# End
