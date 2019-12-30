FROM alpine:latest

ENV PROXY_SERVER=localhost
ENV PROXY_PORT=3128
ENV PROXY_USER=user
ENV PROXY_PASS=pass

RUN set -ex; \
    apk update; \
    apk upgrade; \
    apk add --no-cache redsocks iptables bash; 

WORKDIR /app
ADD . /app

RUN chmod +x *

ENTRYPOINT ["/bin/sh","redsocks.sh"]
