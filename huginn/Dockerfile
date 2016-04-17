# forward request and error logs to docker log collector
FROM cantino/huginn-single-process

EXPOSE 3000

ADD init.sh /scripts/init

WORKDIR /app

CMD ["/scripts/init"]
