FROM alpine

RUN apk --update --no-progress add php-cli
RUN apk add bash
RUN apk add git curl
RUN git clone https://github.com/clue/psocksd.git

RUN apk add php-json php-phar php-openssl 

RUN cd psocksd && curl -s https://getcomposer.org/installer | php && php composer.phar install

CMD php psocksd/bin/psocksd *:9050
