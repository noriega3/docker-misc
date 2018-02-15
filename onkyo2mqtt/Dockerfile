FROM python:latest

RUN easy_install onkyo-eiscp && \
    easy_install paho-mqtt

COPY onkyo2mqtt.py /usr/src/app

ENTRYPOINT [ "/usr/local/bin/python", "/usr/src/app/onkyo2mqtt.py" ]