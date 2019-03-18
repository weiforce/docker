#!/bin/bash

grin server run
echo "yellow" | grin wallet listen
echo "yellow" | grin wallet owner_api

nginx

