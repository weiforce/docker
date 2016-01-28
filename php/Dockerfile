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
RUN apt-get install -y cron
RUN apt-get install -y git

RUN docker-php-ext-install iconv mcrypt
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install zip
RUN docker-php-ext-install pdo_mysql

# start setup php redis
COPY phpredis-2.2.7.tar.gz /
RUN cd / && tar zxvf phpredis-2.2.7.tar.gz && mv phpredis-2.2.7 /usr/src/php/ext/redis
RUN rm -rf /php-redis-2.2.7.tar.gz
RUN docker-php-ext-install redis
# end setup php redis

# start setup xdebug
RUN curl -SL "http://xdebug.org/files/xdebug-2.3.3.tgz" -o xdebug.tar.gz
RUN tar zxvf xdebug.tar.gz && mv xdebug-2.3.3 /usr/src/php/ext/xdebug
RUN docker-php-ext-install xdebug
# end setup xdebug

# start setup xdebug
#COPY phptrace-0.3.0.tar.gz /
#RUN cd / && tar zxvf phptrace-0.3.0.tar.gz && mv phptrace-0.3.0 /usr/src/php/ext/phptrace
#RUN rm -rf /phptrace-0.3.0.tar.gz
#RUN docker-php-ext-install xdebug
#RUN cd /usr/src/php/ext/phptrace
#RUN cd cmdtool
#RUN make
# end setup xdebug

RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
RUN echo "export PATH=\"~/.composer/vendor/bin:\$PATH\"" >> ~/.bashrc

RUN rm -rf /etc/crontab && ln -s /php/crontab /etc/crontab


RUN rm -rf /var/lib/apt/lists/*
RUN rm -rf /usr/src/php

WORKDIR /www

CMD /etc/init.d/cron start && php-fpm
