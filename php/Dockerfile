FROM php:5.5-fpm

RUN rm -rf /usr/local/etc/php-fpm.conf /usr/local/etc/php.ini
RUN mkdir /php
RUN ln -s /php/php.ini /usr/local/etc/php/php.ini
RUN ln -s /php/php-fpm.conf /usr/local/etc/php-fpm.conf

RUN apt-get update
RUN apt-get install -y libfreetype6-dev
RUN apt-get install -y libjpeg62-turbo-dev
RUN apt-get install -y libmcrypt-dev
RUN apt-get install -y libpng12-dev

RUN docker-php-ext-install iconv mcrypt
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd
RUN docker-php-ext-install mysqli

COPY phpredis-2.2.7.tar.gz /

RUN cd / && tar zxvf phpredis-2.2.7.tar.gz && mv phpredis-2.2.7 /usr/src/php/ext/redis
RUN docker-php-ext-install redis

RUN apt-get install -y cron
RUN rm -rf /etc/crontab && ln -s /php/crontab /etc/crontab

RUN rm -rf /phpredis-2.2.7.tar.gz /phpredis-2.2.7
RUN rm -rf /var/lib/apt/lists/*
RUN rm -rf /usr/src/php

CMD /etc/init.d/cron start && php-fpm
