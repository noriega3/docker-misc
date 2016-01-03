FROM debian:jessie

MAINTAINER jonathan@nrgup.net

# Use docker options:
#	-p 80:80

EXPOSE 80

RUN apt-get update && apt-get install --no-install-recommends -y \
	mono-runtime \
	libmono-corlib2.0-cil \
	libmono-system-web4.0-cil \
	libmono-system-numerics4.0-cil \
	libmono-system-serviceprocess4.0-cil \\
	libmono-system-data4.0-cil \
	libmono-system-core4.0-cil \
	libmono-system-servicemodel4.0a-cil \
	libmono-windowsbase4.0-cil \
	libmono-system-runtime-serialization-formatters-soap4.0-cil \
	libmono-system-runtime-serialization4.0-cil \
	libmono-system-xml-linq4.0-cil \
	mono-dmcs \
	libusb-1.0-0 libusb-1.0-0-dev \
	alsa-utils lame \
	lirc libv4l-0 \
	arduino-mk empty-expect

ADD https://github.com/genielabs/HomeGenie/releases/download/v1.1-beta.509/homegenie-beta_1.1.r509_all.deb /tmp/homegenie.deb
RUN dpkg -i /tmp/homegenie.deb

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /usr/local/bin/homegenie
CMD ["mono", "HomeGenie.exe"]
