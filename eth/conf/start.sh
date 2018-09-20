#!/bin/bash
nginx
nohup ss-local -c /root/ss-local.json &
cp /root/proxychains.conf /etc/proxychains/proxychains.conf
proxychains geth --ipcdisable --cache=512 --rpc --rpcport 8332 --rpcapi "db,eth,net,web3,personal"
