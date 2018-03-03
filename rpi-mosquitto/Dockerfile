FROM multiarch/alpine:armhf-latest-stable

RUN apk --no-cache -q -U add mosquitto netcat-openbsd && \
    mkdir -p /mosquitto/config /mosquitto/data /mosquitto/log && \
    cp /etc/mosquitto/mosquitto.conf /mosquitto/config && \
    chown -R mosquitto:mosquitto /mosquitto

VOLUME /mosquitto/config /mosquitto/data /mosquitto/log

EXPOSE 1883

HEALTHCHECK CMD nc -z localhost 1883 || exit 1

CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]