FROM node:0.12-slim

MAINTAINER Julien Maitrehenry "julien.maitrehenry@me.com"

RUN apt-get update \
	&& apt-get -y install wget git \
	&& wget http://repo.zabbix.com/zabbix/2.0/debian/pool/main/z/zabbix-release/zabbix-release_2.0-1wheezy_all.deb \
	&& dpkg -i zabbix-release_2.0-1wheezy_all.deb \
	&& apt-get update \
	&& apt-get -y install zabbix-sender \
	&& git clone --depth=1 https://github.com/etsy/statsd.git \
	&& cd /statsd \
	&& npm install https://github.com/bernd/statsd-influxdb-backend/tarball/master \
	&& npm install statsd-zabbix-backend \
	&& apt-get remove -y wget git \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

ADD config.js /statsd/config.js

EXPOSE 8125/udp
EXPOSE 8126/tcp

CMD /usr/local/bin/node /statsd/stats.js /statsd/config.js