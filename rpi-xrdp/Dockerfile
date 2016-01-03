FROM sdhibit/rpi-raspbian:latest

MAINTAINER jonathan@nrgup.net

EXPOSE 3389

RUN apt-get update && \
  apt-get install --no-install-recommends -y xrdp vnc4server xfonts-base && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
