# Debezium MongoDB 6.0

MongoDB image pre-configured with replica set support for Debezium change data capture.

## Why This Image?

Standard MongoDB images require manual replica set initialization. This image automatically configures a single-node replica set with authentication, which is required for Debezium CDC to work. The mongodb instance is reachable to host machine or in a shared network.

## Key Features

- **Auto-initialized replica set**: Single-node replica set configured on first start
- **Authentication enabled**: Root user created automatically
- **Keyfile authentication**: Pre-generated keyfile for replica set internal auth
- **Shard server mode**: Configured with `--shardsvr` flag
- **Init script support**: Executes `.sh` and `.js` files from `/docker-entrypoint-initdb.d/`
- **Persistent initialization**: Uses marker file to skip re-initialization on restart

## Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `MONGO_INITDB_ROOT_USERNAME` | `admin` | Root user username |
| `MONGO_INITDB_ROOT_PASSWORD` | `admin` | Root user password |
| `MONGO_INITDB_DATABASE` | `admin` | Initial database |
| `RS_NAME` | `rs0` | Replica set name |
| `HOSTNAME` | Container hostname | Replica set member hostname (use `host:port` for external access) |
| `RETRIES` | `30` | Startup connection retries |

## Quick Start

### Basic Usage (Docker Network)

```bash
docker run -d \
  --name mongodb \
  --hostname mongodb \
  -p 27017:27017 \
  -e MONGO_INITDB_ROOT_USERNAME=admin \
  -e MONGO_INITDB_ROOT_PASSWORD=admin \
  -e MONGO_INITDB_DATABASE=inventory \
  quay.io/debezium/mongodb:6.0
```

### Port-Forwarding

```yaml
services:
  mongodb:
    image: quay.io/debezium/mongodb:6.0
    hostname: mongodb
    ports:
      - "27017:27017"
    environment:
      - MONGO_INITDB_ROOT_USERNAME=admin
      - MONGO_INITDB_ROOT_PASSWORD=admin
      - MONGO_INITDB_DATABASE=inventory
```
### Data Persistence

Mount a volume to persist data:

```bash
docker run -d \
  -v mongodb-data:/data/db \
  ... \
  quay.io/debezium/mongodb:6.0
```

### Custom Initialization Scripts

Place scripts in `/docker-entrypoint-initdb.d/`:

```bash
docker run -d \
  -v ./init-scripts:/docker-entrypoint-initdb.d \
  ... \
  quay.io/debezium/mongodb:6.0
```

Scripts are executed only on first initialization, after replica set is configured.