FROM quoinedevops/ubtc:v2.2.0.2

VOLUME /root/.bitcoin

RUN chmod -R 777 /app/ubcd

#CMD ["bitcoind", "-printtoconsole"]
CMD "/app/ubcd -printtoconsole -datadir=/data -rpcuser=root -rpcpassword=test -rpcport=8000 -rpcallowip=0.0.0.0/32"
