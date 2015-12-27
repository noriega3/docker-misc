FROM mono:latest

RUN apt-get update && apt-get install -y \
    flite chromium wget

ADD start.sh /

VOLUME [ "/HomeSeer" ]

CMD ["sh", "/start.sh"]
