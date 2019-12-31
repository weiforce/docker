#!/bin/sh

##########################
# Setup the Firewall rules
##########################
fw_setup() {

  # First we added a new chain called 'SSLOCAL' to the 'nat' table.
  iptables -t nat -N SSLOCAL

  iptables -t nat -A SSLOCAL -d 0.0.0.0/8 -j RETURN
  iptables -t nat -A SSLOCAL -d 10.0.0.0/8 -j RETURN
  iptables -t nat -A SSLOCAL -d 127.0.0.0/8 -j RETURN
  iptables -t nat -A SSLOCAL -d 169.254.0.0/16 -j RETURN
  iptables -t nat -A SSLOCAL -d 172.16.0.0/12 -j RETURN
  iptables -t nat -A SSLOCAL -d 192.168.0.0/16 -j RETURN
  iptables -t nat -A SSLOCAL -d 224.0.0.0/4 -j RETURN
  iptables -t nat -A SSLOCAL -d 240.0.0.0/4 -j RETURN
  iptables -t nat -A SSLOCAL -d $PROXY_SERVER/24 -p tcp -j RETURN

  iptables -t nat -A SSLOCAL -p tcp -j REDIRECT --to-ports 1080

  iptables -t nat -A OUTPUT -p tcp -j SSLOCAL
}

##########################
# Clear the Firewall rules
##########################
fw_clear() {
  iptables-save | grep -v SSLOCAL | iptables-restore
}

case "$1" in
    start)
        echo -n "Setting SSLOCAL firewall rules..."
        fw_clear
        fw_setup
        echo "done."
        ;;
    stop)
        echo -n "Cleaning SSLOCAL firewall rules..."
        fw_clear
        echo "done."
        ;;
    *)
        echo "Usage: $0 {start|stop}"
        exit 1
        ;;
esac
exit 0
