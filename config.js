(function() {
  var backends = [],
    configuration = {
      port: parseInt(process.env.STATSD_PORT) || 8125,
      debug: process.env.STATSD_DEBUG || false,
      percentThresold: [95, 99],
      flushInterval: 10000,
      legacyNamespace: false
    };

  if(process.env.STATSD_ENABLE_CONSOLE) {
    backends.push('./backends/console');
  }

  if(process.env.ZABBIX_HOST) {
    backends.push('statsd-zabbix-backend');

    configuration.zabbixHost = process.env.ZABBIX_HOST;
    configuration.zabbixPort = process.env.ZABBIX_PORT || 10051;
    configuration.zabbixSender = process.env.ZABBIX_SENDER || "/usr/bin/zabbix_sender";
  }

  configuration.backends = backends;

  return configuration;
})();

