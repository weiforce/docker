FROM node:8-alpine

RUN apk add --no-cache git build-base python && \
    git clone https://github.com/paritytech/substrate-ui.git /substrate-ui && \
    cd /substrate-ui && yarn install && \
    apk del git build-base python

WORKDIR /substrate-ui

CMD ["yarn", "run", "dev"]
