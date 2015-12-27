#!/bin/sh

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

# Execute

cd /HomeSeer
export LANG=en_US.UTF-8
exec mono HSConsole.exe --log
