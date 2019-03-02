FROM ethereum/client-go:v1.8.23

RUN apk add --no-cache nginx
RUN apk add --no-cache bash
RUN sed -i "s#pcre_jit on;#pid /run/nginx.pid;#g" /etc/nginx/nginx.conf

RUN apk add --no-cache curl wget

RUN mkdir /var/tmp/nginx/

ENTRYPOINT []
