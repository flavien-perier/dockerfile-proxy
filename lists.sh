#!/bin/sh

rsync -arpogvt rsync://ftp.ut-capitole.fr/blacklist /tmp

mkdir -p /etc/squid/lists
mv /tmp/dest/ads/domains /etc/squid/lists/ads.txt
mv /tmp/dest/ddos/domains /etc/squid/lists/ddos.txt
mv /tmp/dest/hacking/domains /etc/squid/lists/hacking.txt
mv /tmp/dest/phishing/domains /etc/squid/lists/phishing.txt
mv /tmp/dest/adult/domains /etc/squid/lists/porn.txt
mv /tmp/dest/redirector/domains /etc/squid/lists/redirector.txt
mv /tmp/dest/remote-control/domains /etc/squid/lists/remote-control.txt

rm -Rf /tmp/dest
