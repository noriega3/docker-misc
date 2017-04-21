FROM resin/rpi-raspbian

ENV VERSION=3.5.0

ADD http://flightaware.com/adsb/piaware/files/packages/pool/piaware/p/piaware-support/piaware-repository_${VERSION}_all.deb /

RUN dpkg -i /piaware-repository_${VERSION}_all.deb && rm /piaware-repository_${VERSION}_all.deb && \
    apt-get update && apt-get install --no-install-recommends piaware socat && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY piaware.conf /etc

ENTRYPOINT ["/usr/bin/piaware","-debug"]