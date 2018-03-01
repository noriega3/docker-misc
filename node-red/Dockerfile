FROM alpine

# add support for gpio library
RUN apk add -q -U --no-cache \
    ca-certificates \
    curl \
    nodejs \
    su-exec

# Home directory for Node-RED application source code.
# User data directory, contains flows, config and nodes.
WORKDIR /usr/src/node-red

# Home directory for Node-RED application source code.
RUN addgroup -g 501 node-red && \
    adduser -u 501 -h /usr/src/node-red -G node-red -D -H node-red && \
    mkdir -p /usr/src/node-red /data && \
    chown -R node-red:node-red /data && \
    chown -R node-red:node-red /usr/src/node-red

USER node-red

# package.json contains Node-RED NPM module and node dependencies
#COPY package.json /usr/src/node-red/
RUN curl -SLo package.json --progress-bar https://raw.githubusercontent.com/node-red/node-red-docker/master/package.json && \
    npm install

# Healthcheck
HEALTHCHECK CMD curl -q --fail http://localhost:1880/ || exit 1

# User configuration directory volume
EXPOSE 1880

VOLUME /data

# Environment variable holding file path for flows configuration
ENV FLOWS=flows.json
ENV NODE_PATH=/usr/src/node-red/node_modules:/data/node_modules

CMD ["su-exec", "node-red", "npm", "start", "--", "--userDir", "/data"]