FROM debian:jessie

RUN apt-get update
RUN apt-get install -y bind9
RUN rm -rf /var/lib/apt/lists/*

RUN touch /var/log/bind9.log

CMD /etc/init.d/bind9 start && tail -f /var/log/bind9.log
