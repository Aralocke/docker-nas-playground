# Mock Services

This repository acts as a test lab for what I run on my storage NAS in docker. WHen I want to test the containers or the basic setup of the reverse proxy I can use this before deploying them and potentially breaking something in my lab.

## Requirements

1. Docker (of course, but Podman probably works fine)
2. Local hosts file changes

This setup is not meant for anytime of use beyond local on system testing.

## Hosts File Setup

The system hosts file should be updated for local records to allow the reverse proxy to work correctly.

```text
# Local docker vhosts
127.0.0.1	images.lab.local
127.0.0.1	static.lab.local
127.0.0.1	repos.lab.local
127.0.0.1	minio.lab.local object.lab.local
127.0.0.1	traefik-console.lab.local traefik.lab.local
```
