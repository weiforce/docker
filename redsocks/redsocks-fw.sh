#!/bin/sh

##########################
# Setup the Firewall rules
##########################
fw_setup() {

  # First we added a new chain called 'REDSOCKS' to the 'nat' table.
  iptables -t nat -N REDSOCKS

  iptables -t nat -A REDSOCKS -d 0.0.0.0/8 -j RETURN
  iptables -t nat -A REDSOCKS -d 10.0.0.0/8 -j RETURN
  iptables -t nat -A REDSOCKS -d 127.0.0.0/8 -j RETURN
  iptables -t nat -A REDSOCKS -d 169.254.0.0/16 -j RETURN
  iptables -t nat -A REDSOCKS -d 172.16.0.0/12 -j RETURN
  iptables -t nat -A REDSOCKS -d 192.168.0.0/16 -j RETURN
  iptables -t nat -A REDSOCKS -d 224.0.0.0/4 -j RETURN
  iptables -t nat -A REDSOCKS -d 240.0.0.0/4 -j RETURN
  iptables -t nat -A REDSOCKS -d $PROXY_SERVER/24 -p tcp -j RETURN

  # Add the ip that need to be proxied to PREROUTING
  #while read item; do
  #    iptables -t nat -A REDSOCKS -d $item -p tcp -j RETURN
  #done < /etc/redsocks-proxy-ip.txt

  # We then told iptables to redirect all port 80 connections to the http-relay redsocks port and all other connections to the http-connect redsocks port.
  iptables -t nat -A REDSOCKS -p tcp -j REDIRECT --to-ports 12345
  # TODO Supports ports forwarding to other machines

  # Finally we tell iptables to use the ‘REDSOCKS’ chain for all outgoing connection in the network interface ‘eth0′.
  iptables -t nat -A OUTPUT -p tcp -j REDSOCKS
}

##########################
# Clear the Firewall rules
##########################
fw_clear() {
  iptables-save | grep -v REDSOCKS | iptables-restore
  #iptables -L -t nat --line-numbers
  #iptables -t nat -D PREROUTING 2
}

case "$1" in
    start)
        echo -n "Setting REDSOCKS firewall rules..."
        fw_clear
        fw_setup
        echo "done."
        ;;
    stop)
        echo -n "Cleaning REDSOCKS firewall rules..."
        fw_clear
        echo "done."
        ;;
    *)
        echo "Usage: $0 {start|stop}"
        exit 1
        ;;
esac
exit 0
