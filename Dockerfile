FROM alpine

LABEL maintainer="Flavien PERIER <perier@flavien.io>"
LABEL version="1.0"
LABEL description="Squid Proxy"

RUN apk --update --no-cache add squid rsync

ENV DNS=1.1.1.1

COPY start.sh /root/start.sh
COPY squid.conf /etc/squid/squid.conf
COPY lists.sh /etc/squid/lists.sh
COPY bad-words.txt /etc/squid/lists/bad-words.txt

RUN chown -R root:root /etc/squid && \
    chmod 550 /etc/squid/squid.conf && \
    chmod 750 /etc/squid/lists.sh && \
    sh /etc/squid/lists.sh && \
    chown squid:squid -R /etc/squid/lists && \
    chmod 440 -R /etc/squid/lists && \
    rm /etc/squid/lists.sh

VOLUME /var/squid/cache

EXPOSE 3128

CMD /root/start.sh
