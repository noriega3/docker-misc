FROM bradsjm/rpi-zulu-openjdk

ENV EXTRA_JAVA_OPTS="" \
    EXTRA_PACKAGES="" \
    TERM=dumb \
    OPENHAB_HTTP_ADDRESS="0.0.0.0" \
    OPENHAB_HTTP_PORT="8080" \
    OPENHAB_HTTPS_PORT="8443" \
    OPENHAB_VERSION="2.4.0-SNAPSHOT" \
    OPENHAB_HOME="/opt/openhab" \
    OPENHAB_CONF="/opt/openhab/conf" \
    OPENHAB_USERDATA="/opt/openhab/userdata" \
    OPENHAB_LOGDIR="/opt/openhab/userdata/logs" \
    OPENHAB_BACKUPS="/opt/openhab/backups" \
    OPENHAB_SSH_PASSWORD="habopen" \
    OPENHAB_SSH_PORT="8101" \
    OPENHAB_UID=501 \
    OPENHAB_GID=501

# Install required packages
RUN apk add -q -U --no-cache \
    bluez \
    curl \
    su-exec \
    zip

# Install OpenHAB - https://www.openhab.org/ and enable SSH
#   Enables SSH server for console access
RUN set -ex && \
    OPENHAB_URL=https://openhab.ci.cloudbees.com/job/openHAB-Distribution/lastSuccessfulBuild/artifact/distributions/openhab/target/openhab-${OPENHAB_VERSION}.tar.gz && \
    mkdir -p ${OPENHAB_HOME} ${OPENHAB_CONF} ${OPENHAB_USERDATA} ${OPENHAB_LOGDIR} ${OPENHAB_BACKUPS} && \
    curl -SL --progress-bar ${OPENHAB_URL} | tar xzC ${OPENHAB_HOME} && \
    sed -i -e "/sshHost = 0.0.0.0/s/^#//g" ${OPENHAB_CONF}/services/runtime.cfg

# Expose volumes
VOLUME "/opt/openhab/conf" \
       "/opt/openhab/userdata" \
       "/opt/openhab/backups" \
       "/opt/openhab/addons"

# Expose HTTP, HTTPS, Console and LSP ports
EXPOSE 8080 8443 8101 5007

# Set up Healthcheck to check HTTP port
HEALTHCHECK --start-period=3m \
    CMD curl -q -s --fail -X GET --header "Accept: text/plain" "http://localhost:8080/rest/uuid" || exit 1

# Set working directory and entrypoint
WORKDIR ${OPENHAB_HOME}
COPY entrypoint.sh /

# Set entrypoint executable
RUN chmod +x /entrypoint.sh ${OPENHAB_HOME}/start.sh
ENTRYPOINT ["/entrypoint.sh"]

# Execute command
CMD ["su-exec", "openhab", "./start.sh", "server"]