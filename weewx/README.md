# weewx for Docker

This Docker image provides support for [WeeWX](http://www.weewx.com/).
Weewx is a simple, easy to use weather station.

- This image is based on the [alpine] base image.
- rsync and ssh are included to push pages to remote servers.

Consult the [WeeWX documentation](http://www.weewx.com/docs.html) for setup steps.

Running the container:

    docker run \
    --hostname=weewx \
    -v weewx-data:/data:rw \
    --name=weewx bradsjm/weewx