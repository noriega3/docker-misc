FROM multiarch/alpine:armhf-latest-stable

RUN apk add -q -U --no-cache \
        gnutls gnutls-dev \
        libmicrohttpd libmicrohttpd-dev \
        gcc git make g++ linux-headers \
        libusb libusb-dev eudev eudev-dev \
        coreutils && \
    mkdir -p /usr/app && cd /usr/app && \
    git clone https://github.com/OpenZWave/open-zwave.git && \
    cd open-zwave && \
    make && \
    cd .. && \
    git clone https://github.com/OpenZWave/open-zwave-control-panel.git && \
    cd open-zwave-control-panel && \
    sed -i 's/#GNUTLS := -lgnutls/GNUTLS := -lgnutls/' Makefile && \
    sed -i 's/#LIBUSB := -ludev/LIBUSB := -ludev/' Makefile && \
    sed -i 's/#LIBS := $(LIBZWAVE) $(GNUTLS) $(LIBMICROHTTPD) -pthread $(LIBUSB) -lresolv/LIBS := $(LIBZWAVE) $(GNUTLS) $(LIBMICROHTTPD) -pthread $(LIBUSB) -lresolv/' Makefile && \
    sed -i 's/LIBUSB := -framework IOKit -framework CoreFoundation/#LIBUSB := -framework IOKit -framework CoreFoundation/' Makefile && \
    sed -i 's/LIBS := $(LIBZWAVE) $(GNUTLS) $(LIBMICROHTTPD) -pthread $(LIBUSB) $(ARCH) -lresolv/#LIBS := $(LIBZWAVE) $(GNUTLS) $(LIBMICROHTTPD) -pthread $(LIBUSB) $(ARCH) -lresolv/' Makefile && \
    make && \
    ln -sd ../open-zwave/config && \
    strip -p --strip-debug /usr/app/open-zwave-control-panel/ozwcp && \
    apk del libmicrohttpd-dev gcc git make g++ linux-headers libusb-dev eudev-dev coreutils

EXPOSE 8090
WORKDIR /usr/app/open-zwave-control-panel/
ENTRYPOINT ["/usr/app/open-zwave-control-panel/ozwcp"]