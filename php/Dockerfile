FROM php:7.2.24-fpm-alpine

RUN apk add --no-cache bash autoconf build-base \
    && apk add --no-cache bash wget libpng-dev libmcrypt-dev libstdc++ libevent-dev openssl-dev git libzip-dev \
    && docker-php-ext-install gd mysqli pdo_mysql bcmath opcache pcntl \

    && git clone https://github.com/mongodb/mongo-php-driver.git /tmp/php-mongodb \
    && cd /tmp/php-mongodb && git submodule update --init \
    && phpize && ./configure && make && make install \
    && rm -rf /tmp/php-mongodb \

    && apk add --no-cache freetype-dev jpeg-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \

    && pecl install redis \
    && pecl install xdebug \
    && pecl install channel://pecl.php.net/swoole-4.4.12 \
    && pecl install channel://pecl.php.net/mcrypt-1.0.3 \
    && pecl install channel://pecl.php.net/nsq-3.5.0 \
    && pecl install channel://pecl.php.net/zip-1.15.5 \

#    && apk add --no-cache libssh2-dev \
#    && wget http://pecl.php.net/get/ssh2-1.1.2.tgz \
#    && tar zxvf ssh2-1.1.2.tgz && cd ssh2-1.1.2 && phpize && ./configure --with-ssh2 && make \
#    && mv modules/ssh2.so /usr/local/lib/php/extensions/no-debug-non-zts-20170718 \
#    && cd .. && rm -rf ssh2-1.1.2* \

    && apk del build-base autoconf

RUN echo "export TERM=xterm" >> /root/.bashrc \
    && rm -rf /usr/local/etc/php-fpm.conf \
    && mkdir /php \
    && ln -s /php/php.ini /usr/local/etc/php/php.ini \
    && ln -s /php/php-fpm.conf /usr/local/etc/php-fpm.conf

RUN apk add --no-cache git

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === 'a5c698ffe4b8e849a443b120cd5ba38043260d5c4023dbf93e1558871f1f07f58274fc6f4c93bcfd858c6bd0775cd8d1') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/bin/composer && chmod -R 777 /usr/bin/composer

WORKDIR /www

CMD php-fpm
