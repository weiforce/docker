FROM ivories/php

RUN apk add --no-cache supervisor
RUN mkdir /supervisor

COPY supervisord.conf /supervisor/supervisord.conf

ENTRYPOINT [""]
CMD /usr/bin/supervisord -c /supervisor/supervisord.conf -n
