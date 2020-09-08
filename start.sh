#!/bin/sh

chown -R squid:squid /var/squid

DNS_IP=`ping $DNS -c 1 | head -n 1 | cut -f 2 -d "(" | cut -f 1 -d ")"`

cat /etc/squid/squid.conf | sed s/"^dns_nameservers .*"/"dns_nameservers $DNS_IP"/ > /tmp/squid.conf
cat /tmp/squid.conf > /etc/squid/squid.conf
rm /tmp/squid.conf

squid -N -z
squid -N -S -d 1
