from alpine:3.5

RUN apk add --update --no-cache bash openssh findutils php5 && rm -rf /var/cache/apk/*

RUN apk add --update --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/community/ emacs && rm -rf /var/cache/apk/*

RUN apk add --update --no-cache --repository http://nl.alpinelinux.org/alpine/edge/testing cscope && rm -rf /var/cache/apk/*

RUN echo "export TERM=xterm" >> /root/.bashrc

COPY emacs.sh /usr/bin/e
RUN chmod -R 777 /usr/bin/e
RUN cd /root && mkdir .ssh && chmod -R 700 /root/.ssh
RUN echo "PasswordAuthentication no" > /etc/ssh/sshd_config

CMD cp /authorized_keys /root/.ssh/ && chmod 600 /root/.ssh/authorized_keys && /usr/sbin/sshd -D

# ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa 
