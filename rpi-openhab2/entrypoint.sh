#!/bin/sh

# Karaf needs a pseudo-TTY so exit and instruct user to allocate one when necessary
#test -t 0
#if [ $? -eq 1 ]; then
#  echo "Please start the openHAB container with a pseudo-TTY using the -t option or 'tty: true' with docker compose"
#  exit 1
#fi

set -euo pipefail
IFS=$'\n\t'

# Install any extra Alpine packages
if [ -n "${EXTRA_PACKAGES}" ]; then
  apk add -U --no-cache ${EXTRA_PACKAGES}
fi

# Create openhab user as needed
if ! id -u openhab 2>/dev/null 1>&2; then
  echo "Creating user 'openhab' with ID ${OPENHAB_UID}:${OPENHAB_GID}"
  addgroup -g ${OPENHAB_GID} openhab
  adduser -u ${OPENHAB_UID} -G openhab -h ${OPENHAB_HOME} -D openhab
fi

# Configure SSH password for openhab user
if [ -n "${OPENHAB_SSH_PASSWORD}" ]; then
  echo "Setting SSH password for openhab user"
  sed -i -e "s/^openhab = .*,/openhab = ${OPENHAB_SSH_PASSWORD},/g" ${OPENHAB_USERDATA}/etc/users.properties
fi

# Configure SSH port number
if [ -n "${OPENHAB_SSH_PORT}" ]; then
  echo "Setting SSH port to ${OPENHAB_SSH_PORT}"
  sed -i -e "s/^sshPort = .*/sshPort = ${OPENHAB_SSH_PORT}/g" ${OPENHAB_USERDATA}/etc/org.apache.karaf.shell.cfg
fi

echo -n "Cleaning cache and temporary files ... "
# Deleting instance.properties to avoid karaf PID conflict on restart
# See: https://github.com/openhab/openhab-docker/issues/99
if [ -s ${OPENHAB_HOME}/runtime/instances/instance.properties ]; then
  rm -f ${OPENHAB_HOME}/runtime/instances/instance.properties
fi

# Clear out any cache and tmp files
mkdir -p ${OPENHAB_USERDATA}/cache ${OPENHAB_USERDATA}/tmp
find ${OPENHAB_USERDATA}/cache -type f -exec rm -f {} \;
find ${OPENHAB_USERDATA}/tmp -type f -exec rm -f {} \;
touch ${OPENHAB_LOGDIR}/events.log ${OPENHAB_LOGDIR}/openhab.log
echo "Done"

# Fix openhab folder permissions
echo -n "Checking ownership of ${OPENHAB_HOME} ... "
find ${OPENHAB_HOME} ! -user openhab ! -group openhab -exec chown -h openhab:openhab {} \+
echo "Done"

tail -f ${OPENHAB_LOGDIR}/events.log -f ${OPENHAB_LOGDIR}/openhab.log &
exec "$@"