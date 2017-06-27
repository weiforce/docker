#!/bin/bash

if [ "$1" == "" ] || [ "$2" == "" ]; then
    echo make.sh "domain" "DNS:domain.com,DNS:www.domain.com"
    exit
fi

ACME_PATH=/home/core/data/www/acme/$1

mkdir -p $ACME_PATH
cd $ACME_PATH

if [ ! -f "$ACME_PATH/account.key" ]; then
    openssl genrsa 4096 > account.key
    openssl genrsa 4096 > domain.key
    openssl req -new -sha256 -key domain.key -subj "/" -reqexts SAN -config <(cat /etc/ssl/openssl.cnf <(printf "[SAN]\nsubjectAltName=$2")) > domain.csr
    openssl req -new -sha256 -key domain.key -out domain.csr
fi

docker run -it --rm -v $ACME_PATH:/www ivories/acme python /acme_tiny.py --account-key /www/account.key --csr /www/domain.csr --acme-dir /www/ > $ACME_PATH/signed.crt

wget -O - https://letsencrypt.org/certs/lets-encrypt-x3-cross-signed.pem > intermediate.pem
cat signed.crt intermediate.pem > chained.pem
wget -O - https://letsencrypt.org/certs/isrgrootx1.pem > root.pem
cat intermediate.pem root.pem > full_chained.pem

systemctl restart nginx

echo 'write nginx conf:'
echo 'server {
    server_name domain.com;

    location ^~ /.well-known/acme-challenge/ {
        alias $ACME_PATH;
    }
}
server {
    server_name domain.com;
    listen 443;
    ssl on;
    ssl_certificate     $ACME_PATH/chained.pem;
    ssl_certificate_key $ACME_PATH/domain.key;
}
'
