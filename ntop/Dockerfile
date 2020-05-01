FROM vimagick/ntopng

RUN cat /etc/issue

RUN echo "redis-server &\n ntopng \"--community\",\"--data-dir\",\"/var/lib/ntopng\",\"--http-port\",\"0.0.0.0:3000\",\"--interface\",\"tcp://0.0.0.0:5556c\"" > /start.sh

RUN chmod -R 777 /start.sh

ENTRYPOINT "/start.sh"



