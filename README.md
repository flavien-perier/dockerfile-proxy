# Dockerfile Proxy

Dockerfile for [Squid](https://github.com/squid-cache/squid) proxy.

## Env variables

- DNS: Default proxy DNS

## Ports

- 3128: TCP

## Volumes

- /var/squid/cache

## Docker-compose example

```yaml
proxy:
  image: flavienperier/proxy
  container_name: proxy
  restart: always
  volumes:
    - ./cache:/var/squid/cache
  ports:
    - 3128:3128
  environment:
    DNS: 1.1.1.1
```
