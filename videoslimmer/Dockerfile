FROM jlesage/mkvtoolnix

RUN apk --no-cache add python2 git && \
    git clone https://github.com/binhex/videoslimmer.git /usr/app

ENTRYPOINT [ "/usr/bin/python", "/usr/app/VideoSlimmer.py", "--mkvmerge",  "/usr/bin/mkvmerge" ]
