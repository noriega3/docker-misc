FROM multiarch/alpine:armhf-latest-stable

RUN apk add curl && \
    curl --progress-bar -LSo glibc-2.23-r3.apk https://github.com/chrisanthropic/docker-alpine-rpi-glibc-builder/releases/download/0.0.1/glibc-2.23-r3.apk && \
    curl --progress-bar -LSo glibc-bin-2.23-r3.apk https://github.com/chrisanthropic/docker-alpine-rpi-glibc-builder/releases/download/0.0.1/glibc-bin-2.23-r3.apk && \
    curl --progress-bar -LSo glibc-i18n-2.23-r3.apk https://github.com/chrisanthropic/docker-alpine-rpi-glibc-builder/releases/download/0.0.1/glibc-i18n-2.23-r3.apk && \
    apk add --allow-untrusted *.apk && \
    rm *.apk && \
    apk del curl
