FROM  yan047/eos:v1.6.0

RUN apt-get -yqq  update \
    && apt-get -yqq install apt-utils net-tools mongodb nginx \
    && sed -i "s#pcre_jit on;#pid /run/nginx.pid;#g" /etc/nginx/nginx.conf \
    && sed -i  "s|include /etc/nginx/sites-enabled/|#include /etc/nginx/sites-enabled/|g" /etc/nginx/nginx.conf

RUN mkdir /var/tmp/nginx/
COPY conf/start.sh /
RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]
CMD [""]
