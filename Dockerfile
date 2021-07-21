FROM alpine

LABEL maintainer="Flavien PERIER <perier@flavien.io>" \
      version="1.0.0" \
      description="Squid Proxy"

ENV DNS="1.1.1.1"

VOLUME /var/squid/cache
COPY start.sh /root/start.sh
COPY squid.conf /etc/squid/squid.conf
COPY lists.sh /etc/squid/lists.sh
COPY bad-words.txt /etc/squid/lists/bad-words.txt

RUN apk --update --no-cache add squid rsync && \
    chown -R root:root /etc/squid && \
    chmod 550 /etc/squid/squid.conf && \
    chmod 750 /etc/squid/lists.sh && \
    sh /etc/squid/lists.sh && \
    chown squid:squid -R /etc/squid/lists && \
    chmod 440 -R /etc/squid/lists && \
    rm /etc/squid/lists.sh && \
    chown root:root /root/start.sh && \
    chmod 750 /root/start.sh

EXPOSE 3128

CMD /root/start.sh
