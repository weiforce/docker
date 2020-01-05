FROM alpine

RUN mkdir /APP
RUN mkdir /data

WORKDIR /APP

RUN wget https://github.com/exercism/cli/releases/download/v3.0.13/exercism-3.0.13-linux-x86_64.tar.gz; \
    tar zxvf exercism-3.0.13-linux-x86_64.tar.gz; \
    rm -rf exercism-3.0.13-linux-x86_64.tar.gz; \
    ln -s /APP/exercism /usr/bin/exercism;

#RUN exercism configure -w /data

WORKDIR /data
