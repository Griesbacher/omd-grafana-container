# OMD with Grafana
#  uses daily edition, which may contain unstable versions but it contains the newest.

# Run:
# $ docker run -it --rm -p 80:80 -p 443:443 -h omd griesbacher/omd-grafana

# browser: 127.0.0.1/default [windows: https://docs.docker.com/engine/installation/windows/#container-port-redirection]
# user: omdadmin
# pass: omd
# It takes a few seconds till the first Performancedata is created.

FROM debian:8

MAINTAINER Philip Griesbacher, philip.griesbacher@consol.de

RUN gpg --keyserver keys.gnupg.net --recv-keys F8C1CA08A57B9ED7
RUN gpg --armor --export F8C1CA08A57B9ED7 | apt-key add -
RUN echo 'deb http://labs.consol.de/repo/testing/debian jessie main' >> /etc/apt/sources.list

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get upgrade -y && apt-get install -y omd-labs-edition-daily net-tools iputils-ping

RUN omd create default
RUN omd config default set TMPFS off
RUN omd config default set INFLUXDB on
RUN omd config default set NAGFLUX on
RUN omd config default set GRAFANA on
RUN omd config default set CORE icinga2
RUN omd config default set PNP4NAGIOS off
RUN sed -i -e s/srv-pnp/srv-perf/g /omd/sites/default/etc/icinga2/conf.d/services.conf
RUN sed -i -e s/host-pnp/host-perf/g /omd/sites/default/etc/icinga2/conf.d/hosts.conf

EXPOSE 80
EXPOSE 443

COPY ./entrypoint.sh /entrypoint.sh
RUN sed -i 's/\r//' /entrypoint.sh #Just for Windowssystems...

ENTRYPOINT ["/entrypoint.sh"]
