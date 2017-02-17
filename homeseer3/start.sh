#!/bin/sh
trap exit 0 SIGTERM
export LANG=en_US.UTF-8

TIMEZONE=${TIMEZONE:-"America/Los_Angeles"}
echo $TIMEZONE > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

# Get current version
[ -f /HomeSeer/version.txt ] && VERSION=$(cat /HomeSeer/version.txt)

# Get remote version
HS_URL=$(curl -sL http://homeseer.com/current-downloads.html | grep -Po 'http://homeseer.com/updates3/hs3_linux_3[0-9_.]+.tar.gz')

# Download and untar if versions are not the same
if [ "$VERSION" != "$HS_URL" ]; then
  echo "Downloading $HS_URL ..."
  mkdir -p /HomeSeer && ln -s /HomeSeer /usr/local/HomeSeer
  wget -qO - "${HS_URL}" | tar -C /HomeSeer -zx --strip-components 1
  echo "$HS_URL" > /HomeSeer/version.txt
fi

chown -R root:root /HomeSeer

# bug fix for case sensitive filesystems
# without this myhs.homeseer.com wont load icons
ln -s /HomeSeer/html/images/homeseer /HomeSeer/html/images/HomeSeer

# Execute
cd /HomeSeer
exec mono HSConsole.exe --log
