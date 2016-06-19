FROM cantino/huginn

RUN sed 's/exec \/usr\/bin/#exec/g' /scripts/init > /init
RUN chmod -R 777 /init && /init

CMD "exec /usr/bin/supervisord -c /etc/supervisor/supervisord.conf"
