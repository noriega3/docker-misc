FROM multiarch/alpine:armhf-latest-stable

ENV ID=0B7NYXizl0U6iVGlEOEw5RUQwdkk

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl && \
    curl -SL "https://drive.google.com/a/nrgup.net/uc?export=download&id=$ID" \
    | tar -xzC /usr/local/bin modesmixer2 && \
    apt-get remove --purge -y curl && apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

COPY ./services /etc/services
ADD ./silhouettes.tar.gz /var/images/silhouettes

ENTRYPOINT ["/usr/local/bin/modesmixer2","--silhouettes","/var/images/silhouettes"]