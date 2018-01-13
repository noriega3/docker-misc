FROM alpine
ENV WEEWX_VERSION 3.8.0

COPY requirements.txt /tmp
RUN apk add --no-cache python-dev py-pip gcc curl \
            musl-dev sqlite-dev zlib-dev jpeg-dev \
            openssh-client rsync ttf-freefont unzip && \
    cd /tmp && \
    pip install --no-cache-dir -r requirements.txt && \
    curl -SL http://www.weewx.com/downloads/released_versions/weewx-${WEEWX_VERSION}.tar.gz \
        | tar -xzC . && \
    cd weewx-${WEEWX_VERSION} && \
    sed -i 's|^\(home\s*=\s*\).*$|\1/opt/weewx|' setup.cfg && \
    python setup.py install --no-prompt && \
    apk del gcc && \
    curl -SL -o weewx-netatmo.zip https://github.com/matthewwall/weewx-netatmo/archive/master.zip && \
    curl -SL -o weewx-influx.zip https://github.com/matthewwall/weewx-influx/archive/master.zip && \
    /opt/weewx/bin/wee_extension --install weewx-netatmo.zip && \
    /opt/weewx/bin/wee_extension --install weewx-influx.zip && \
    rm -r /tmp/*

VOLUME ["/data"]
COPY weewx.conf /data/weewx.conf

CMD ["/opt/weewx/bin/weewxd","/data/weewx.conf","-x"]
