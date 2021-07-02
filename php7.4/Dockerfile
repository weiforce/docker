FROM php:7.4-fpm-alpine

RUN apk add --no-cache bash autoconf build-base bash wget libpng-dev libmcrypt-dev libstdc++ libevent-dev openssl-dev git libzip-dev

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/community/ >> /etc/apk/repositories

RUN docker-php-ext-install mysqli

