FROM alpine

LABEL maintainer="Flavien PERIER <perier@flavien.io>" \
      version="1.0.0" \
      description="Squid Proxy"

ENV DNS="1.1.1.1"

VOLUME /var/squid/cache

COPY --chown=root:root start.sh /root/start.sh
COPY --chown=root:root squid.conf /etc/squid/squid.conf
COPY --chown=root:root lists.sh /etc/squid/lists.sh
COPY --chown=squid:squid bad-words.txt /etc/squid/lists/bad-words.txt

RUN apk --update --no-cache add squid rsync && \
    chmod 550 /etc/squid/squid.conf && \
    chmod 750 /etc/squid/lists.sh && \
    sh /etc/squid/lists.sh && \
    chmod 440 -R /etc/squid/lists && \
    rm /etc/squid/lists.sh && \
    chmod 750 /root/start.sh

EXPOSE 3128

CMD /root/start.sh
