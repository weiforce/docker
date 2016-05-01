FROM alpine

RUN apk --update add build-base autoconf 
RUN wget http://iweb.dl.sourceforge.net/project/ss5/ss5/3.8.9-8/ss5-3.8.9-8.tar.gz
RUN tar zxvf ss5-3.8.9-8.tar.gz

RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk update && apk add --update --no-cache linux-pam
RUN apk add linux-pam-dev

RUN apk add bash
RUN apk add openldap-dev libpcap-dev openssl
RUN cd ss5-3.8.9 && ./configure

CMD bash
# && make && make install

#RUN touch /etc/opt/ss5/ss5.passwd
#RUN touch /etc/opt/ss5/ss5.ha

#COPY conf/ss5.conf /etc/opt/ss5/ss5.conf

#EXPOSE 18080

#CMD /usr/sbin/ss5 -t -b 0.0.0.0:18080 && /usr/bin/tail -f /var/log/ss5/ss5.log
