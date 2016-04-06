# docker-omd-grafana
OMD with Grafana, InfluxDB, Nagflux and Histou configured

Run:
$ docker build -t omd-grafana .
$ docker run -it --rm -p 80:80 -p 443:443 -h omd omd-grafana

browser: 127.0.0.1/default [windows: https://docs.docker.com/engine/installation/windows/#container-port-redirection]
user: omdadmin
pass: omd
It takes a few seconds till the first Performancedata is created.
