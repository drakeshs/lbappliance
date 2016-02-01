FROM ubuntu:14.04
MAINTAINER Michael Duffy <mduffy@stunthamster.com>

RUN apt-get update
RUN apt-get install -y software-properties-common supervisor git apache2 libapache2-modsecurity libapache2-mod-rpaf
RUN add-apt-repository ppa:vbernat/haproxy-1.6
RUN apt-get update
RUN apt-get install -y  haproxy

ADD data/scripts/configure_modsec.sh /tmp/configure_modsec.sh

RUN chmod 766 /tmp/configure_modsec.sh && sync && \
    /tmp/configure_modsec.sh

ADD data/supervisor/supervisord.conf /etc/supervisord.conf

EXPOSE 80 443

CMD ["/usr/bin/supervisord"]