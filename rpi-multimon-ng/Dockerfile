FROM bradsjm/rpi-rtl-sdr:latest

COPY multimon-ng.pro /tmp

RUN apk add --no-cache git build-base qt qt-dev && \
    git clone https://github.com/EliasOenal/multimon-ng.git /tmp/multimon-ng && \
    cd /tmp/multimon-ng && \
    mv /tmp/multimon-ng.pro . && \
    mkdir build && cd build && \
    qmake ../multimon-ng.pro PREFIX=/usr && \
    make && make install && \
    cd / && rm -r /tmp/multimon-ng && \
    apk del git build-base qt-dev
