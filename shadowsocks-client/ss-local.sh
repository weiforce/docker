#!/bin/bash
echo "Configuration:"
echo "PROXY_SERVER=$PROXY_SERVER"
echo "PROXY_PORT=$PROXY_PORT"
echo "PROXY_PASS=$PROXY_PASS"
echo "Setting config variables"

echo "Activating iptables rules..."
sh ./firewall.sh start

pid=0

term_handler() {
    if [ $pid -ne 0 ]; then
        echo "Term signal catched. Shutdown redsocks and disable iptables rules..."
        kill -SIGTERM "$pid"
        wait "$pid"
        sh ./firewall.sh stop
    fi
    exit 143; # 128 + 15 -- SIGTERM
}

trap 'kill ${!}; term_handler' SIGTERM

echo "Starting ss-local..."
ss-local -s "$PROXY_SERVER" -p "$PROXY_PORT" -k "$PROXY_PASS" -m "chacha20-ietf" -t "60" -u --fast-open -b "0.0.0.0" -l "1080" &
# --plugin "obfs-server" --plugin-opts "obfs=tls"
pid="$!"

while true
do
    tail -f /dev/stdout & wait ${!}
done
