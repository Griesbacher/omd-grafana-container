# docker-omd-grafana
OMD with Grafana, InfluxDB, Nagflux and Histou configured
## Build & Run
creates Image with newest OMD
``` bash
$ git clone https://github.com/Griesbacher/omd-grafana-container.git
$ cd omd-grafana-container
$ docker build -t griesbacher/omd-grafana .
$ docker run -it --rm -p 80:80 -p 443:443 -h omd griesbacher/omd-grafana
```
## Run
if not build manually before, the latest Version from hub.docker.com can be used: https://hub.docker.com/r/griesbacher/omd-grafana/
``` bash
$ docker run -it --rm -p 80:80 -p 443:443 -h omd griesbacher/omd-grafana
browser: 127.0.0.1/default [windows: https://docs.docker.com/engine/installation/windows/#container-port-redirection]
user: omdadmin
pass: omd
It takes a few seconds till the first Performancedata is created.
```
