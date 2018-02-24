FROM resin/raspberry-pi-alpine-node:8

RUN npm install frontail@4.0.4 --global

ENTRYPOINT ["frontail"]
EXPOSE 9001
CMD ["--help"]