FROM python:2

RUN easy_install onkyo-eiscp && \
    easy_install paho-mqtt

COPY onkyo2mqtt.py /usr/src/app/onkyo2mqtt.py

ENTRYPOINT [ "/usr/local/bin/python", "/usr/src/app/onkyo2mqtt.py" ]