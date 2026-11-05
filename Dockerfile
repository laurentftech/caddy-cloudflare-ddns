# syntax=docker/dockerfile:1
ARG CADDY_VERSION=2.10.2
FROM caddy:builder AS builder

ARG CADDY_VERSION
RUN xcaddy build v${CADDY_VERSION} \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-dynamicdns

ARG CADDY_VERSION
FROM caddy:${CADDY_VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
