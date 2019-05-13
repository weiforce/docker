#!/bin/bash

#grin server run

#nginx

sleep 5

grin-wallet listen < ~/.grin/passwd &

sleep 5

grin-wallet owner_api < ~/.grin/passwd &

sleep 5

