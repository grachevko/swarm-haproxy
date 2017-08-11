FROM haproxy:alpine

MAINTAINER Konstantin Grachev <me@grachevko.ru>

ENV HAPROXY_CFG_DIR /usr/local/etc/haproxy

RUN apk add --no-cache bash

COPY conf.d ${HAPROXY_CFG_DIR}/conf.d
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["haproxy", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]
HEALTHCHECK --interval=5s --timeout=2s --start-period=30s CMD nc -z 127.0.0.1 80
