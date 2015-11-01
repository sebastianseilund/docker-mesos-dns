FROM ubuntu:14.04

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install curl && \
    apt-get -y clean

RUN curl -L -o /mesos-dns.gz https://github.com/mesosphere/mesos-dns/releases/download/v0.4.0/mesos-dns-v0.4.0-linux-amd64.gz && \
    gunzip /mesos-dns && \
    chmod +x /mesos-dns

CMD ["/mesos-dns", "-config", "/config.json"]
