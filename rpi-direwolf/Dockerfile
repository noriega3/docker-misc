FROM bradsjm/rpi-rtlsdr:latest

#
# Note: Run the image with the following options:
#	--privileged
#

MAINTAINER jonathan@nrgup.net

EXPOSE 8000 8001

#
# Direwolf
#

RUN apt-get update && apt-get --no-install-recommends -y install libasound2-dev
WORKDIR /usr/local/src
RUN git clone -b 1.2 git://www.github.com/wb2osz/direwolf
WORKDIR /usr/local/src/direwolf
ADD Makefile.linux /usr/local/src/direwolf/Makefile.linux
RUN make tocalls-symbols || exit 0
RUN make && make install && make clean
ADD direwolf.conf /root/direwolf.conf

#
# Auto start direwolf
#

ADD start.sh /root/start.sh
RUN chmod +x /root/start.sh
CMD ["/root/start.sh"]

WORKDIR /root

# End
