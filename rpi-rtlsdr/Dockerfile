FROM sdhibit/rpi-raspbian:latest

#
# Note: Run the image with the following options:
#	--device=/dev/bus/usb -p 1234:1234 -p 8080:8080
#

MAINTAINER jonathan@nrgup.net

EXPOSE 1234 8080

RUN apt-get update && apt-get install --no-install-recommends -y \
        apt-utils \
	git-core \
	build-essential \
	cmake \
	pkg-config \
	libusb-1.0-0-dev

#
# RTL-SDR Tools
#

WORKDIR /usr/local/src
RUN git clone git://git.osmocom.org/rtl-sdr.git && mkdir /usr/local/src/rtl-sdr/build

WORKDIR /usr/local/src/rtl-sdr/build
RUN cmake ../ -DINSTALL_UDEV_RULES=ON -DDETACH_KERNEL_DRIVER=ON && make && make install && ldconfig

WORKDIR /root
RUN rm -rf /usr/local/src/rtl-sdr/build

#
# Kalibrate-RTL
#

RUN apt-get --no-install-recommends -y install automake libtool libfftw3-dev
WORKDIR /usr/local/src
RUN git clone -b arm_memory git://github.com/asdil12/kalibrate-rtl.git
WORKDIR /usr/local/src/kalibrate-rtl
RUN ./bootstrap && ./configure && make && make install && make clean

#
# Multimon-NG
#
RUN apt-get --no-install-recommends -y install libqtcore4 qt4-qmake
WORKDIR /usr/local/src
RUN git clone git://github.com/EliasOenal/multimonNG.git && mkdir /usr/local/src/multimonNG/build
WORKDIR /usr/local/src/multimonNG/build
COPY multimonNG/multimon-ng.pro /usr/local/src/multimonNG/multimon-ng.pro
RUN qmake ../multimon-ng.pro && make && make install
WORKDIR /root
RUN rm -rf /usr/local/src/multimonNG/build

#
# Dump1090
#
RUN apt-get --no-install-recommends -y install wget
WORKDIR /root
RUN wget http://flightaware.com/adsb/piaware/files/dump1090_1.2-3_armhf.deb
RUN dpkg -i dump1090_1.2-3_armhf.deb && rm -f dump1090_1.2-3_armhf.deb

# End
