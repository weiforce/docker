FROM ivories/python

RUN apk add --no-cache wget bash && wget https://raw.githubusercontent.com/diafygi/acme-tiny/master/acme_tiny.py && apk del wget

RUN echo 'python /acme_tiny.py $*' > /usr/bin/acme && chmod -R 777 /usr/bin/acme

ENTRYPOINT bash
