#!/bin/sh

set -e

chown -R squid:squid /var/squid

DNS_IP=`ping $DNS -c 1 | head -n 1 | cut -f 2 -d "(" | cut -f 1 -d ")"`

sed -i s/"^dns_nameservers dns$"/"dns_nameservers $DNS_IP"/g \
    /etc/squid/squid.conf

squid -N -f /etc/squid/squid.conf -z
squid -N -S -d 1
