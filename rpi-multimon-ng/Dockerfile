FROM bradsjm/rpi-rtl-sdr:latest

COPY multimon-ng.pro /tmp

RUN apk add --no-cache git build-base libgcc qt-dev && \
    git clone https://github.com/EliasOenal/multimon-ng.git /tmp/multimon-ng && \
    cd /tmp/multimon-ng && \
    mv /tmp/multimon-ng.pro . && \
    mkdir build && cd build && \
    qmake ../multimon-ng.pro PREFIX=/usr/local && \
    make && make install && \
    cd / && rm -r /tmp/multimon-ng && \
    find /usr/local/bin -type f -exec strip -p --strip-debug {} \; && \   
    apk del git build-base qt-dev

CMD "/usr/local/bin/multimon-ng"