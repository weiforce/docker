FROM node:13-alpine

RUN apk add --no-cache git build-base && \
    git clone https://github.com/polkadot-js/apps.git /polkadot-js && \
    cd /polkadot-js && yarn install && \
    apk del git build-base

WORKDIR /polkadot-js

CMD ["yarn", "run", "start"]
