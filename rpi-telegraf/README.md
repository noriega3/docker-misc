# rpi-telegraf
Telegraf is an agent for collecting metrics and writing them to InfluxDB or other outputs.

This build is for the Raspberry Pi using Alpine Linux base. The Dockerfile is at https://github.com/bradsjm/Dockerfiles/tree/master/rpi-telegraf

Telegraf is an open source agent written in Go for collecting metrics and data on the system it's running on or from other services. Telegraf writes data it collects to InfluxDB in the correct format.

[Telegraf Official Docs](https://docs.influxdata.com/telegraf/latest/introduction/getting-started-telegraf/)

### Exposed Ports

-	8125 StatsD
-	8092 UDP
-	8094 TCP

### Using the default configuration

The default configuration requires a running InfluxDB instance as an output plugin. Ensure that InfluxDB is running on port 8086 before starting the Telegraf container.

Minimal example to start an InfluxDB container:

```console
$ docker run -d --name influxdb -p 8083:8083 -p 8086:8086 bradsjm/rpi-influxdb
```

Starting Telegraf using the default config, which connects to InfluxDB at `http://localhost:8086/`:

```console
$ docker run --net=container:influxdb bradsjm/rpi-telegraf
```

### Using a custom config file

First, generate a sample configuration and save it as `telegraf.conf` on the host:

```console
$ docker run --rm bradsjm/rpi-telegraf -sample-config > telegraf.conf
```

Once you've customized `telegraf.conf`, you can run the Telegraf container with it mounted in the expected location:

```console
$ docker run -v $PWD/telegraf.conf:/etc/telegraf/telegraf.conf:ro bradsjm/rpi-telegraf
```

Modify `$PWD` to the directory where you want to store the configuration file.

Read more about the Telegraf configuration [here](https://docs.influxdata.com/telegraf/latest/introduction/configuration/).

This image is based on the popular [Alpine Linux project](http://alpinelinux.org), available in [the `alpine` official image](https://hub.docker.com/_/alpine). Alpine Linux is much smaller than most distribution base images (~5MB), and thus leads to much slimmer images in general.

# License

View [license information](https://github.com/influxdata/telegraf/blob/master/LICENSE) for the software contained in this image.