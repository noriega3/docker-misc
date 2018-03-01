FROM arm32v6/node:8-alpine

RUN apk add -q -U --no-cache git curl && \
    mkdir -p /usr/src && cd /usr/src && \
    git clone https://github.com/mthenw/frontail.git && \
    cd frontail && npm install && \
    apk del git

COPY ./openhab.json /usr/src/frontail/preset/default.json

VOLUME /data

HEALTHCHECK CMD curl -q --fail http://localhost:9001/ || exit 1

ENTRYPOINT ["/usr/src/frontail/bin/frontail"]

EXPOSE 9001

CMD ["--help"]