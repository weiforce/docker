FROM ubuntu:14.04

ENV PROXY_SERVER=localhost
ENV PROXY_PORT=3128
ENV PROXY_USER=user
ENV PROXY_PASS=pass

RUN apt update
RUN apt install -y iptables git libevent-dev libssl-dev openssl build-essential; 
RUN git clone https://github.com/semigodking/redsocks.git redsocks; 
RUN cd redsocks; make ENABLE_HTTPS_PROXY=true; 

WORKDIR /app
ADD . /app

RUN chmod +x *

RUN mv /redsocks/redsocks2 /usr/bin/redsocks

ENTRYPOINT ["/bin/sh","redsocks.sh"]
