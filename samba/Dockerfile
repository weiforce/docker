FROM debian:jessie

RUN apt-get update
RUN apt-get install -y samba

RUN rm -rf /var/lib/apt/lists/*

WORKDIR /data

CMD /etc/init.d/samba restart && tail -f /var/log/samba/log
