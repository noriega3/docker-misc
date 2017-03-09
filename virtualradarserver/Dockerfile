FROM mono:latest

RUN mkdir -p /opt/vrs \
    && curl -SL http://www.virtualradarserver.co.uk/Files/VirtualRadar.tar.gz \
    | tar -xzC /opt/vrs

RUN curl -SL http://www.virtualradarserver.co.uk/Files/VirtualRadar.WebAdminPlugin.tar.gz \
    | tar -xzC /opt/vrs

RUN curl -SL http://www.virtualradarserver.co.uk/Files/VirtualRadar.exe.config.tar.gz \
    | tar -xC /opt/vrs

RUN curl -SL http://www.virtualradarserver.co.uk/Files/VirtualRadar.DatabaseWriterPlugin.tar.gz \
    | tar -xzC /opt/vrs

RUN curl -SL http://www.virtualradarserver.co.uk/Files/VirtualRadar.CustomContentPlugin.tar.gz \
    | tar -xzC /opt/vrs

RUN curl -SL http://www.virtualradarserver.co.uk/Files/VirtualRadar.DatabaseEditorPlugin.tar.gz \
    | tar -xzC /opt/vrs

ADD ./logos.tar.gz /opt/vrs/Flags

ADD ./sideviews.tar.gz /opt/vrs/Silhouettes

RUN mkdir -p /config \
    && mkdir -p /root/.local/share \
    && ln -sf /config /root/.local/share/VirtualRadar

RUN chown -R root:root /opt/vrs

WORKDIR /opt/vrs

VOLUME /config

EXPOSE 8080

CMD ["mono", "/opt/vrs/VirtualRadar.exe", "-nogui", "-createAdmin:admin", "-password:password"]
