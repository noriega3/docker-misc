FROM bradsjm/rpi-alpine-glibc

ENV LC_ALL="en_US.UTF-8" \
    LANG="en_US.UTF-8" \
    LANGUAGE="en_US.UTF-8"

# Upgrade required for ttf font install to work properly
RUN apk upgrade -q -U -a --no-cache && \
    apk add -q -U --no-cache \
    ca-certificates \
    curl \
    fontconfig \
    ttf-dejavu && \
	ZULU_ARCH="ezdk-1.8.0_152-8.25.0.76-eval-linux_aarch32hf.tar.gz" && \
	INSTALL_DIR=/usr/lib/jvm && \
	BIN_DIR=/usr/bin && \
	MAN_DIR=/usr/share/man/man1 && \
	ZULU_DIR=$( basename ${ZULU_ARCH} .tar.gz ) && \
	mkdir -p ${INSTALL_DIR} && \
	curl -SL --progress-bar http://cdn.azul.com/zulu-embedded/bin/${ZULU_ARCH} | tar -xzC ${INSTALL_DIR} && \
	cd ${BIN_DIR}; find ${INSTALL_DIR}/${ZULU_DIR}/bin -type f -perm -a=x -exec ln -s {} . \; && \
	mkdir -p ${MAN_DIR} && \
	cd ${MAN_DIR}; find ${INSTALL_DIR}/${ZULU_DIR}/man/man1 -type f -name "*.1" -exec ln -s {} . \; && \
	java -version && \
	apk del curl