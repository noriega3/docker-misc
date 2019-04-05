# Base Image ##################################################################
ARG ARCH=armhf
FROM multiarch/alpine:${ARCH}-v3.9 as base

RUN cat /etc/apk/repositories && \
    echo "@testing ${ALPINE_MIRROR}/edge/testing" >> /etc/apk/repositories && \
    cat /etc/apk/repositories && \
    apk add --no-cache \
        tini \
        libusb \
        librtlsdr@testing \
        musl libgcc libstdc++

# Builder Image ###############################################################
FROM base as builder

RUN apk add --no-cache \
    git build-base qt-dev \
    libusb-dev \
    librtlsdr-dev@testing

COPY multimon-ng.pro /tmp

RUN git clone https://github.com/EliasOenal/multimon-ng.git /tmp/multimon-ng && \
    cd /tmp/multimon-ng && \
    mv /tmp/multimon-ng.pro . && \
    mkdir build && cd build && \
    qmake ../multimon-ng.pro PREFIX=/usr/local && \
    make && make install && \
    find /usr/local/bin -type f -exec strip -p --strip-debug {} \;

# Final Image #################################################################
FROM base

COPY --from=builder /usr/local/bin/multimon-ng /usr/local/bin/multimon-ng

ENTRYPOINT ["tini", "--"]

# Metadata
ARG VCS_REF="Unknown"
LABEL maintainer="jb@nrgup.net" \
    org.label-schema.name="rtl_433" \
    org.label-schema.description="Docker container for RTL_433" \
    org.label-schema.url="https://github.com/bradsjm/dockerfiles" \
    org.label-schema.vcs-ref="${VCS_REF}" \
    org.label-schema.vcs-url="https://github.com/bradsjm/dockerfiles" \
    org.label-schema.schema-version="1.0"

CMD "/usr/local/bin/multimon-ng"