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

  if(process.env.INFLUXDB_HOST) {
    backends.push('statsd-influxdb-backend');
    
    configuration.influxdb = {
      host: process.env.INFLUXDB_HOST,
      port: parseInt(process.env.INFLUXDB_PORT) || 8086,
      version: parseFloat(process.env.INFLUXDB_VERSION) || 0.9,
      database: process.env.INFLUXDB_DATABASE || "monitoring",
      username: process.env.INFLUXDB_USERNAME || "root",
      password: process.env.INFLUXDB_PASSWORD || "password",
      flush: {
        enable: process.env.INFLUXDB_ENABLE_FLUSH || "true"
      },
    };
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

