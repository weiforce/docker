from alpine

run echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
 && apk update \
 && apk add --update --no-cache emacs@testing
run apk add bash openssh

RUN echo "export TERM=xterm" >> /root/.bashrc

COPY emacs.sh /usr/bin/e
RUN chmod -R 777 /usr/bin/e
RUN cd /root && mkdir .ssh && chmod -R 700 /root/.ssh
RUN echo "PasswordAuthentication no" > /etc/ssh/sshd_config

CMD cp /authorized_keys /root/.ssh/ && chmod 600 /root/.ssh/authorized_keys && ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa && /usr/sbin/sshd -D
