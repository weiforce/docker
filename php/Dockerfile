FROM alpine

RUN apk --update --no-progress add build-base php7-dev autoconf \
    php7-fpm php7-mcrypt php7-curl php7-gd php7-json php7-openssl \
    php7-pdo_mysql php7-pdo_sqlite php7-phar php7-iconv php7-ctype \
    php7-bcmath \
    php7-opcache php7-mysqli php7-zip php7-pgsql zlib git bash openssl-dev curl \
    && curl -s -o phpredis-2.2.7.tar.gz -b a -L https://github.com/phpredis/phpredis/archive/2.2.7.tar.gz \
    && curl -s -o xdebug-2.3.3.tgz -b a -L https://xdebug.org/files/xdebug-2.3.3.tgz \
    && curl -s -o xhprof-0.9.4.tgz -b a -L http://pecl.php.net/get/xhprof-0.9.4.tgz \
    && curl -s -o mongo-1.6.14.tgz -b a -L http://pecl.php.net/get/mongo-1.6.14.tgz \
    && cd / && tar zxvf phpredis-2.2.7.tar.gz && cd /phpredis-2.2.7 && phpize5 \
    && ./configure --with-php-config=/usr/bin/php-config7 && make && make install && rm -rf /phpredis-2.2.7 /phpredis-2.2.7.tar.gz \
    && cd / && tar zxvf xdebug-2.3.3.tgz && cd /xdebug-2.3.3 && phpize5 \
    && ./configure --with-php-config=/usr/bin/php-config7 && make && make install && rm -rf /xdebug-2.3.3 /xdebug-2.3.3.tgz \
    && cd / && tar zxvf xhprof-0.9.4.tgz && cd /xhprof-0.9.4/extension && phpize5 \
    && ./configure --with-php-config=/usr/bin/php-config7 && make && make install && rm -rf /xhprof-0.9.4 /xhprof-0.9.4.tgz \
    && cd / && tar zxvf mongo-1.6.14.tgz && cd /mongo-1.6.14 && phpize5 \
    && ./configure --with-php-config=/usr/bin/php-config7 && make && make install && rm -rf /mongo-1.6.14 /mongo-1.6.14.tgz \
    && apk del build-base autoconf openssl-dev \
    && rm -rf /var/cache/apk/* 

RUN echo "export TERM=xterm" >> /root/.bashrc \
    && rm -rf /etc/php7/php-fpm.conf /etc/php7/php.ini \
    && mkdir /php \
    && ln -s /php/php.ini /etc/php7/php.ini \
    && ln -s /php/php-fpm.conf /etc/php7/php-fpm.conf

WORKDIR /www

CMD php-fpm5

