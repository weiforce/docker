FROM debian:jessie

RUN apt-get update
RUN apt-get install -y emacs
RUN apt-get install -y locales

RUN rm -rf /var/lib/apt/lists/*

COPY emacs.sh /usr/bin/e

RUN chmod -R 777 /usr/bin/e

CMD /usr/bin/e
