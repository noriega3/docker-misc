FROM python:latest

RUN easy_install onkyo-eiscp && \
    easy_install paho-mqtt && \
    git clone https://github.com/owagner/onkyo2mqtt.git /usr/src/app/onkyo2mqtt

ENTRYPOINT [ "/usr/local/bin/python", "/usr/src/app/onkyo2mqtt/onkyo2mqtt.py" ]