FROM alpine

RUN apk add --no-cache --virtual=.build-dependencies build-base wget ca-certificates tar xz git && \
    git clone https://github.com/litecoin-project/litecoin.git && \
    cd litecoin/src 
#    make -f makefile.unix USE_UPNP=0 && \
#    strip litecoind && \
#    apk del .build-dependencies && \
#    rm /tmp/*

