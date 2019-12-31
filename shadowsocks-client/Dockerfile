FROM ivories/shadowsocks

RUN apk add --no-cache iptables

WORKDIR /work
ADD . /work
RUN chmod +x *


ENTRYPOINT ["/bin/sh","ss-local.sh"]
