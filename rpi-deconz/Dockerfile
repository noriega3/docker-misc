FROM bradsjm/rpi-tightvncserver:latest

MAINTAINER jonathan@nrgup.net

# Use docker options:
#	--priviledged -p 80:80 -p 5901:5901

EXPOSE 80 5901

VOLUME /config

RUN apt-get update && apt-get install --no-install-recommends -y \
	libqt4-core \
	libqtgui4 \
	libudev0 \
	libcap2-bin \
	blackbox \
	sudo \
	curl \
	wget
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD http://www.dresden-elektronik.de/rpi/gcfflasher/gcfflasher-latest.deb /tmp
ADD http://www.dresden-elektronik.de/rpi/deconz/deconz-latest.deb /tmp
ADD start.sh /

RUN dpkg -i /tmp/gcfflasher-latest.deb /tmp/deconz-latest.deb && rm /tmp/*.deb
RUN ln -sf /root /home/root && \
	mkdir -p /home/root/.local/share/data/dresden-elektronik/deCONZ && \
	ln -sf /home/root/.local/share/data/dresden-elektronik/deCONZ /config && \
	chmod +x /start.sh

ENV DISPLAY=:1
ENV USER=root
CMD ["/start.sh"]
