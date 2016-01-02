FROM bradsjm/rpi-vnc4server:latest

MAINTAINER jonathan@nrgup.net

# Use docker options:
#	--priviledged -p 80:80 -p 5901:5901

EXPOSE 80 5901

RUN apt-get update && apt-get install --no-install-recommends -y \
	libqt4-core \
	libqtgui4 \
	libudev0 \
	libcap2-bin \
	blackbox \
	sudo \
	curl \
	wget

ADD http://www.dresden-elektronik.de/rpi/gcfflasher/gcfflasher-latest.deb /tmp
ADD http://www.dresden-elektronik.de/rpi/deconz/deconz-latest.deb /tmp
ADD passwd /root/.vnc/passwd
ADD start.sh /

RUN dpkg -i /tmp/gcfflasher-latest.deb /tmp/deconz-latest.deb && rm /tmp/*.deb
RUN ln -sf /root /home/root && chmod +x /start.sh

ENV DISPLAY=:1
ENV USER=root
CMD ["/start.sh"]
