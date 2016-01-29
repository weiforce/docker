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
RUN cd / && tar zxvf phpredis-2.2.7.tar.gz
RUN rm -rf /php-redis-2.2.7.tar.gz
RUN cd /phpredis-2.2.7 && phpize && ./configure && make && make install
RUN rm -rf /php-redis-2.2.7
# end setup php redis

# start setup xdebug
COPY xdebug-2.3.3.tar.gz /
RUN cd / && tar zxvf xdebug-2.3.3.tar.gz
RUN rm -rf /php-redis-2.2.7.tar.gz
RUN cd /xdebug-2.3.3 && phpize && ./configure && make && make install
RUN rm -rf /xdebug-2.3.3
# end setup xdebug

# start setup phptrace
COPY phptrace-0.3.0.tar.gz /
RUN cd / && tar zxvf phptrace-0.3.0.tar.gz
RUN rm -rf /php-redis-2.2.7.tar.gz
RUN cd /phptrace-0.3.0/extension && phpize && ./configure && make && make install && cd ../cmdtool && make && mv phptrace /usr/bin && mv trace-php /usr/bin/
RUN rm -rf /phptrace-0.3.0
# end setup phptrace

RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
RUN echo "export PATH=\"~/.composer/vendor/bin:\$PATH\"" >> ~/.bashrc

RUN rm -rf /etc/crontab && ln -s /php/crontab /etc/crontab
RUN rm -rf /var/lib/apt/lists/*
RUN rm -rf /usr/src/php

WORKDIR /www

CMD /etc/init.d/cron start && php-fpm
