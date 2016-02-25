# forward request and error logs to docker log collector
FROM alpine

RUN apk add -U nginx \
    && rm -rf /var/cache/apk/*

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

RUN chown -R nginx:nginx /var/log/nginx/access.log
RUN chown -R nginx:nginx /var/log/nginx/error.log
RUN chown -R nginx:nginx /var/lib/nginx

USER nginx
VOLUME /usr/share/nginx/html
EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
