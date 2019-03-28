# Base Image ##################################################################
FROM multiarch/alpine:armhf-v3.9 as base

RUN cat /etc/apk/repositories && \
    echo '@edge http://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories && \
    echo '@testing http://nl.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
    cat /etc/apk/repositories && \
    apk add --no-cache tini librtlsdr@testing libusb socat

# Builder Image ###############################################################
FROM base as builder

RUN apk add --no-cache \
        curl ca-certificates unzip \
        coreutils make cmake gcc pkgconf \
        libc-dev librtlsdr-dev@testing libusb-dev

RUN curl -L --output '/tmp/rtl_433.zip' "https://github.com/merbanan/rtl_433/archive/master.zip" && \
    cd /tmp && \
    unzip /tmp/rtl_433.zip && \
    mkdir -p /tmp/rtl_433-master/build && \
    cd /tmp/rtl_433-master/build && \
    cmake .. && \
    make && \
    make install

# Final Image #################################################################
FROM base

COPY --from=builder /usr/local/include/rtl_433* /usr/local/include/
COPY --from=builder /usr/local/bin/rtl_433 /usr/local/bin/rtl_433
COPY --from=builder /usr/local/etc/rtl_433/* /usr/local/etc/rtl_433/
COPY run.sh /

ENTRYPOINT ["tini", "--", "sh", "-c", "/run.sh"]

# Metadata
ARG VCS_REF="Unknown"
LABEL maintainer="jb@nrgup.net" \
      org.label-schema.name="rtl_433" \
      org.label-schema.description="Docker container for RTL_433" \
      org.label-schema.url="https://github.com/bradsjm/docker-ads-b" \
      org.label-schema.vcs-ref="${VCS_REF}" \
      org.label-schema.vcs-url="https://github.com/bradsjm/docker-ads-b" \
      org.label-schema.schema-version="1.0"
