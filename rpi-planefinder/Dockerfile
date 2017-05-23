FROM resin/rpi-raspbian

ENV VERSION=3.7.20

ADD http://client.planefinder.net/pfclient_${VERSION}_armhf.deb /tmp

RUN dpkg -i /tmp/pfclient_${VERSION}_armhf.deb

EXPOSE 30053 30054

ENTRYPOINT ["/usr/bin/pfclient"]