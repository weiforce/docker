FROM golang:1.11.5

RUN apt-get update 
RUN apt-get install -yqq nginx \  
    && sed -i "s#pcre_jit on;#pid /run/nginx.pid;#g" /etc/nginx/nginx.conf \
    && rm -rf /etc/nginx/sites-enabled/default \
    && git clone https://github.com/Bytom/bytom.git $GOPATH/src/github.com/bytom \
    && cd $GOPATH/src/github.com/bytom \
    && make bytomd \
    && make bytomcli 
    

#FROM scratch
#
##WORKDIR /btm
#VOLUME /btm
#
##COPY --from=0 /go/src/github.com/bytom/cmd/bytomd   /btm/
##COPY --from=0 /go/src/github.com/bytom/cmd/bytomcli /btm/
##COPY --from=0 /go/src/github.com/bytom/cmd/miner    /btm/
#
#COPY --from=0 /go/src/github.com/bytom/cmd/         /btm/
COPY start.sh /

RUN chmod +x /start.sh

CMD ["/bin/sh","/start.sh"]
