FROM alpine

RUN apk --update --no-progress add build-base php-dev autoconf \
    php-fpm php-mcrypt php-curl php-gd php-json php-openssl \
    php-pdo_mysql php-pdo_sqlite php-phar php-iconv php-ctype \
    php-opcache php-mysqli php-zip zlib git bash \
    && rm -rf /var/cache/apk/* \
    && echo "export TERM=xterm" >> /root/.bashrc

#RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
#RUN docker-php-ext-install mbstring

# start setup php redis
COPY phpredis-2.2.7.tar.gz /
RUN cd / && tar zxvf phpredis-2.2.7.tar.gz
RUN cd /phpredis-2.2.7 && phpize && ./configure && make && make install
RUN rm -rf /phpredis-2.2.7 /phpredis-2.2.7.tar.gz
# end setup php redis

# start setup xdebug
COPY xdebug-2.3.3.tar.gz /
RUN cd / && tar zxvf xdebug-2.3.3.tar.gz
RUN cd /xdebug-2.3.3 && phpize && ./configure && make && make install
RUN rm -rf /xdebug-2.3.3 /xdebug-2.3.3.tar.gz
# end setup xdebug

# start setup phptrace
#COPY phptrace-0.3.0.tar.gz /
#RUN cd / && tar zxvf phptrace-0.3.0.tar.gz
#RUN cd /phptrace-0.3.0/extension && phpize && ./configure && make && make install && cd ../cmdtool && make && mv phptrace /usr/bin && mv trace-php /usr/bin/
#RUN rm -rf /phptrace-0.3.0 /php-redis-2.2.7.tar.gz
# end setup phptrace

RUN rm -rf /etc/php/php-fpm.conf /etc/php/php.ini
RUN mkdir /php
RUN ln -s /php/php.ini /etc/php/php.ini
RUN ln -s /php/php-fpm.conf /etc/php/php-fpm.conf

RUN rm -rf /var/spool/cron/crontabs/root
RUN ln -s /php/crontab /var/spool/cron/crontabs/root

WORKDIR /www

CMD php-fpm && crond -l 2 -f
