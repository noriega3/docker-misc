FROM sdhibit/rpi-raspbian:latest

MAINTAINER jonathan@nrgup.net

EXPOSE 5901

RUN apt-get update && \
    apt-get install --no-install-recommends -y tightvncserver xfonts-base && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
