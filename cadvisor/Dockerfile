#
# Dockerfile for cadvisor
#

FROM alpine:edge
MAINTAINER kev <noreply@easypi.info>

ENV CADVISOR_VERSION 0.24.1

RUN set -xe \
RUN apk add ca-certificates openssl device-mapper zfs \
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.23-r3/glibc-2.23-r3.apk \
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.23-r3/glibc-bin-2.23-r3.apk \
RUN apk add --allow-untrusted glibc-2.23-r3.apk glibc-bin-2.23-r3.apk \

RUN set -xe \
    && wget https://github.com/google/cadvisor/releases/download/v${CADVISOR_VERSION}/cadvisor -O /usr/bin/cadvisor \
    && chmod +x /usr/bin/cadvisor

EXPOSE 8080

ENTRYPOINT ["cadvisor", "-logtostderr"]
