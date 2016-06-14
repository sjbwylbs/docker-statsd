FROM node:0.12-slim

MAINTAINER Wenhao Liu "sjbwylbs@gmail.com"

RUN  mkdir /statsd \
	&& cd /statsd \
	&& npm install statsd-zabbix-backend 

ADD config.js /statsd/config.js

EXPOSE 8125/udp
EXPOSE 8126/tcp

CMD /usr/local/bin/node /statsd/stats.js /statsd/config.js
