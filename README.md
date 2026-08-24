# kof-docker-image

Docker image for [Kof4j](https://github.com/KofLang/Kof4j) - a modern JVM-based language with native compilation support.

## Features

- Based on Ubuntu 22.04 LTS
- Includes Java 21 (required by Kof)
- Automatically builds the latest Kof release
- Multi-architecture support (x86_64)

## Quick Start

```bash
docker pull ghcr.io/koflang/kof:latest
docker run -it ghcr.io/koflang/kof
```

## Building Locally

```bash
docker build -t kof:local .
```

## GitHub Actions

This repository uses GitHub Actions to automatically:
1. Build the latest Kof from source
2. Create a Docker image
3. Push to GitHub Container Registry (ghcr.io)

The workflow runs on:
- Push to `main` branch
- New GitHub releases from KofLang/Kof4j
- Manual trigger
- **Weekly check** (every Monday at 8am UTC) - automatically detects new Kof releases

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `KOF_VERSION` | Kof version to build | `latest` |

## License

MIT
