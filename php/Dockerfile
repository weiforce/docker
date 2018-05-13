FROM php:7.2-fpm-alpine

RUN apk --update --no-progress add build-base php7-dev autoconf \
    php7-fpm php7-mcrypt php7-curl php7-gd php7-json php7-openssl php7-redis php7-xdebug \
    php7-pdo_mysql php7-pdo_sqlite php7-phar php7-iconv php7-ctype \
    php7-bcmath php7-opcache php7-mysqli php7-zip php7-pgsql \
    zlib git bash openssl-dev curl \
    && pecl install swoole \

#curl -s -o xhprof-0.9.4.tgz -b a -L http://pecl.php.net/get/xhprof-0.9.4.tgz \
#&& cd / && tar zxvf xhprof-0.9.4.tgz && cd /xhprof-0.9.4/extension && phpize7 \
#&& ./configure --with-php-config=/usr/bin/php-config7 && make && make install && rm -rf /xhprof-0.9.4 /xhprof-0.9.4.tgz \

    && apk del build-base autoconf openssl-dev \
    && rm -rf /var/cache/apk/* 

RUN echo "export TERM=xterm" >> /root/.bashrc \
    && rm -rf /etc/php7/php-fpm.conf /etc/php7/php.ini \
    && mkdir /php \
    && ln -s /php/php.ini /etc/php7/php.ini \
    && ln -s /php/php-fpm.conf /etc/php7/php-fpm.conf

WORKDIR /www

CMD php-fpm7

