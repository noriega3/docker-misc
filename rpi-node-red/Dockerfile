FROM multiarch/alpine:armhf-latest-stable

# add support for gpio library
RUN apk add -q -U --no-cache \
    ca-certificates \
    curl \
    nodejs \
    py-rpigpio \
    su-exec

# Home directory for Node-RED application source code.
# User data directory, contains flows, config and nodes.
WORKDIR /usr/src/node-red

# Add node-red user so we aren't running as root.
RUN addgroup node-red && \
    adduser -h /usr/src/node-red -G node-red -D -H node-red && \
    mkdir -p /usr/src/node-red /data && \
    chown -R node-red:node-red /data && \
    chown -R node-red:node-red /usr/src/node-red

# Need to build bcrypt dependency on arm as no binary exists
RUN apk add -q -u --no-cache --virtual builds-deps build-base python && \
	npm rebuild bcrypt --build-from-source && \
    apk del builds-deps

# package.json contains Node-RED NPM module and node dependencies
RUN curl -SLo package.json --progress-bar https://raw.githubusercontent.com/node-red/node-red-docker/master/package.json && \
    npm install

# User configuration directory volume
EXPOSE 1880

# Healthcheck
HEALTHCHECK CMD curl -q --fail http://localhost:1880/ || exit 1

VOLUME /data

# Environment variable holding file path for flows configuration
ENV FLOWS=flows.json \
    NODE_PATH=/usr/src/node-red/node_modules:/data/node_modules

CMD ["su-exec", "node-red", "npm", "start", "--", "--userDir", "/data"]