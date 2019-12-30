#!/bin/bash
echo "Configuration:"
echo "PROXY_SERVER=$PROXY_SERVER"
echo "PROXY_PORT=$PROXY_PORT"
echo "PROXY_USER=$PROXY_USER"
echo "PROXY_PASS=$PROXY_PASS"
echo "Setting config variables"
sed -i "s/vPROXY-SERVER/$PROXY_SERVER/g" redsocks.conf
sed -i "s/vPROXY-PORT/$PROXY_PORT/g" redsocks.conf
sed -i "s/vPROXY-USER/$PROXY_USER/g" redsocks.conf
sed -i "s/vPROXY-PASS/$PROXY_PASS/g" redsocks.conf

echo "Activating iptables rules..."
sh ./redsocks-fw.sh start

pid=0

term_handler() {
    if [ $pid -ne 0 ]; then
        echo "Term signal catched. Shutdown redsocks and disable iptables rules..."
        kill -SIGTERM "$pid"
        wait "$pid"
        sh ./redsocks-fw.sh stop
    fi
    exit 143; # 128 + 15 -- SIGTERM
}

trap 'kill ${!}; term_handler' SIGTERM

echo "Starting redsocks..."
/usr/bin/redsocks -c redsocks.conf &
pid="$!"

while true
do
    tail -f /dev/stdout & wait ${!}
done
