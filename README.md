# Statsd Dockerfile

This repository contains Dockerfile of statsd with influxdb and zabbix backend

[![](https://badge.imagelayers.io/jmaitrehenry/statsd:latest.svg)](https://imagelayers.io/?images=jmaitrehenry/statsd:latest 'Get your own badge on imagelayers.io')

## Base Docker Image

[node:0.12-slim](https://registry.hub.docker.com/_/node/)

## Installation

1. Install [Docker](https://www.docker.com/)
2. Have an influxdb server running
3. Download image from public [Docker Hub Registry](https://registry.hub.docker.com/repos/jmaitrehenry/) 
	`docker pull jmaitrehenry/statsd`

## Usage

```
docker run -d -p 8125:8125/udp \
	-e "STATSD_PORT=8125"
	-e "STATSD_ENABLE_CONSOLE=true" \
	-e "STATSD_DEBUG=true" \
	-e "INFLUXDB_VERSION=0.9" \
    -e "INFLUXDB_HOST=127.0.0.1" \
    -e "INFLUXDB_PORT=8086" \
    -e "INFLUXDB_DATABASE=monitoring" \
    -e "INFLUXDB_USERNAME=root" \
    -e "INFLUXDB_PASSWORD=password" \
    -e "INFLUXDB_ENABLE_FLUSH=true" \
    -e "ZABBIX_HOST=127.0.0.1" \
    -e "ZABBIX_PORT=10051" \
    -e "ZABBIX_SENDER=/usr/bin/zabbix_sender"
    jmaitrehenry/statsd
```

- All environnement variables have a default value
- For enable influxdb backend, set INFLUXDB_HOST
- For enable zabbix backend, set ZABBIX_HOST
- For enable console backend, set STATSD_ENABLE_CONSOLE

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## Credits

- [Julien Maitrehenry](https://github.com/jmaitrehenry)

## License

The MIT License

Copyright (c) 2015 Julien Maitrehenry http://www.jmaitrehenry.ca

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
