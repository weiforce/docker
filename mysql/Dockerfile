FROM alpine

COPY ./entrypoint.sh /

RUN chmod +x /entrypoint.sh \
    && apk --update add mariadb \
    && addgroup mysql mysql \
    && rm -rf /var/lib/mysql \
    && mkdir -p /var/lib/mysql \
    && chown -R mysql:mysql /var/lib/mysql \
    && chown -R mysql:mysql /etc/mysql/ \
    && rm -rf /var/cache/apk/*

VOLUME /var/lib/mysql /var/log/mysql /etc/mysql/ /tmp

EXPOSE 3306
USER mysql

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "mysqld", "--user=mysql" ]
