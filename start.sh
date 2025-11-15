#!/bin/sh

set -e

chown -R squid:squid /var/squid

sed -i s/"^dns_nameservers dns$"/"dns_nameservers $DNS"/g \
    /etc/squid/squid.conf

squid -N -f /etc/squid/squid.conf -z
squid -N -S -d 1
