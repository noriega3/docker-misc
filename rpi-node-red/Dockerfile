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

# package.json contains Node-RED NPM module and node dependencies
#COPY package.json /usr/src/node-red/
RUN curl -SLo package.json --progress-bar https://raw.githubusercontent.com/node-red/node-red-docker/master/package.json && \
    npm install --save bcrypt-nodejs && npm uninstall --save bcrypt

# User configuration directory volume
EXPOSE 1880

# Healthcheck
HEALTHCHECK CMD curl -q --fail http://localhost:1880/ || exit 1

VOLUME /data

# Environment variable holding file path for flows configuration
ENV FLOWS=flows.json \
    NODE_PATH=/usr/src/node-red/node_modules:/data/node_modules

CMD ["su-exec", "node-red", "npm", "start", "--", "--userDir", "/data"]