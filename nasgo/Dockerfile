FROM ubuntu:16.04
  
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh && \
    apt-get update && apt-get install -qqy wget && \
    wget https://github.com/NASGO/nasgo-node/releases/download/1.0.0/nasgo-node-linux.tar.gz && \
    tar -zxvf nasgo-node-linux.tar.gz && \
    cd nasgo-node && \
    ./install.sh

EXPOSE 9040

ENTRYPOINT ["/bin/sh", "/entrypoint.sh" ]
