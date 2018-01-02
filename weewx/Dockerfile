FROM alpine
ENV WEEWX_VERSION 3.8.0

COPY requirements.txt /tmp
RUN apk add --no-cache python-dev py-pip gcc curl \
            musl-dev sqlite-dev zlib-dev jpeg-dev \
            openssh-client rsync ttf-freefont && \
    cd /tmp && \
    pip install --no-cache-dir -r requirements.txt && \
    curl -SL http://www.weewx.com/downloads/released_versions/weewx-${WEEWX_VERSION}.tar.gz \
        | tar -xzC . && \
    cd weewx-${WEEWX_VERSION} && \
    sed -i 's|^\(home\s*=\s*\).*$|\1/opt/weewx|' setup.cfg && \
    python setup.py install --no-prompt && \
    cd .. && rm -r requirements.txt weewx-${WEEWX_VERSION} && \
    apk del gcc curl

VOLUME ["/data"]
COPY weewx.conf /data/weewx.conf

CMD ["/opt/weewx/bin/weewxd","/data/weewx.conf"]
