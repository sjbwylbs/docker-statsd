FROM node:0.12-slim

MAINTAINER Wenhao Liu "sjbwylbs@gmail.com"

RUN apt-get update \
	&& apt-get -y install wget git \
	&& wget http://repo.zabbix.com/zabbix/3.0/debian/pool/main/z/zabbix-release/zabbix-release_3.0-1+wheezy_all.deb \
	&& dpkg -i zabbix-release_3.0-1+wheezy_all.deb \
	&& apt-get update \
	&& apt-get -y install zabbix-sender \
	&& git clone --depth=1 https://github.com/etsy/statsd.git \
	&& npm install -g cnpm --registry=https://registry.npm.taobao.org \
	&& cd /statsd \
	&& cnpm install statsd-zabbix-backend \
	&& apt-get remove -y wget git \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

ADD config.js /statsd/config.js

EXPOSE 8125/udp
EXPOSE 8126/tcp

CMD /usr/local/bin/node /statsd/stats.js /statsd/config.js