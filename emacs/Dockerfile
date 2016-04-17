from alpine

run echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
 && apk update \
 && apk add --update --no-cache emacs@testing
run apk add bash openssh

COPY emacs.sh /usr/bin/e
RUN chmod -R 777 /usr/bin/e
RUN touch /var/log/emacs.log

CMD tail -f /var/log/emacs.log

#entrypoint emacs
