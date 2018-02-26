FROM multiarch/alpine:armhf-latest-stable

RUN apk add --no-cache chrony

COPY chrony.conf /etc/chrony/chrony.conf

EXPOSE 123/udp
EXPOSE 323/udp

CMD ["/usr/sbin/chronyd","-d"]
