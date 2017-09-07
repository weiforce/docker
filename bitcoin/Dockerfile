FROM felixweis/bitcoind:latest

ENV BITCOIN_REPOSITORY bitcoin
ENV BITCOIN_BRANCH master

EXPOSE 18333 18332

VOLUME /root/.bitcoin

CMD "bitcoind -testnet -printtoconsole"
