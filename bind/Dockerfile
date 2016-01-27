FROM debian:jessie

RUN apt-get update
RUN apt-get install -y bind9
RUN rm -rf /var/lib/apt/lists/*

CMD /usr/sbin/named
