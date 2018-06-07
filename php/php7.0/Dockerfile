FROM php:7.0-fpm-alpine3.7

RUN apk add --no-cache libpng-dev bash autoconf build-base \
    && docker-php-ext-install gd mysqli pdo_mysql bcmath opcache \
    && pecl install redis \
    && pecl install xdebug \
    && pecl install swoole \
    && apk del build-base autoconf


