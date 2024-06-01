FROM alpine

LABEL org.opencontainers.image.title="Proxy" \
      org.opencontainers.image.description="Squid Proxy" \
      org.opencontainers.image.version="1.0.0" \
      org.opencontainers.image.vendor="flavien.io" \
      org.opencontainers.image.maintainer="Flavien PERIER <perier@flavien.io>" \
      org.opencontainers.image.url="https://github.com/flavien-perier/dockerfile-proxy" \
      org.opencontainers.image.source="https://github.com/flavien-perier/dockerfile-proxy" \
      org.opencontainers.image.licenses="MIT"

ENV DNS="1.1.1.1"

VOLUME /var/squid/cache

RUN apk --update --no-cache add squid && \
    mkdir -p /etc/squid/lists/

COPY --chown=root:root --chmod=500 start.sh /root/start.sh
COPY --chown=root:root --chmod=400 squid.conf /etc/squid/squid.conf
ADD --chown=www-data:www-data --chmod=444 https://dl.red.flag.domains/red.flag.domains.txt /etc/squid/lists/red-flag-domains.txt

EXPOSE 3128

CMD /root/start.sh
