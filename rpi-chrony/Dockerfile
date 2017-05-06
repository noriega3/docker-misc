FROM hypriot/rpi-alpine:latest

RUN apk add --no-cache chrony

# TODO: link /var/run to /run
COPY chrony.conf /etc/chrony/chrony.conf

EXPOSE 123/udp
EXPOSE 323/udp

CMD ["/usr/sbin/chronyd","-d"]
