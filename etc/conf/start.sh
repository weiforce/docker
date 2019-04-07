#!/bin/bash
nginx
geth --fast --cache=512 --rpc --rpcport 8332 --rpcapi "db,eth,net,web3,personal"
