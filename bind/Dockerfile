FROM debian:jessie

RUN touch /var/log/bind9.log
RUN apt-get update
RUN apt-get install -y bind9

CMD /etc/init.d/bind9 start && tail -f /var/log/bind9.log
