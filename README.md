# Caddy Cloudflare DDNS

Custom Caddy Docker image with Cloudflare modules for DNS challenge and dynamic DNS.

## Included Modules

- [caddy-dns/cloudflare](https://github.com/caddy-dns/cloudflare) - DNS challenge for ACME certificates
- [caddy-cloudflare-ip](https://github.com/WeidiDeng/caddy-cloudflare-ip) - Restore real client IP behind Cloudflare proxy
- [caddy-dynamicdns](https://github.com/mholt/caddy-dynamicdns) - Dynamic DNS updates

## Usage

```bash
docker pull ghcr.io/laurentftech/caddy-cloudflare-ddns:latest
```

```yaml
# docker-compose.yml
services:
  caddy:
    image: ghcr.io/laurentftech/caddy-cloudflare-ddns:latest
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./Caddyfile:/etc/caddy/Caddyfile
      - caddy_data:/data
      - caddy_config:/config
    environment:
      - CLOUDFLARE_API_TOKEN=your_token

volumes:
  caddy_data:
  caddy_config:
```

## Automatic Builds

This image is automatically rebuilt daily when a new Caddy version is released.
