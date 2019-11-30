FROM node:carbon-alpine

RUN apk add --no-cache git build-base libsodium libsodium-dev libtool autoconf automake python sqlite-dev sqlite
RUN git clone https://github.com/NASGO/nasgo.git && cd nasgo && npm i

WORKDIR /nasgo

CMD ["node", "app.js"]
#CMD "/usr/local/bin/node /nasgo/app.js"
