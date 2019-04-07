FROM golang:1.9-alpine
RUN apk add --no-cache git make gcc musl-dev linux-headers
RUN go get -d github.com/ethereumproject/go-ethereum/cmd/geth
RUN go install github.com/ethereumproject/go-ethereum/cmd/geth

RUN cp /go/bin/geth /usr/local/bin/

RUN apk add --no-cache nginx
RUN sed -i "s#pcre_jit on;#pid /run/nginx.pid;#g" /etc/nginx/nginx.conf

ENTRYPOINT []
