# Debezium Docker Images

This is a forked version of https://github.com/debezium/container-images.

We forked it for 2 reasons:

1. Inject AWS MSK IAM dependency
2. Remove jboss user (remove the need for initContainers in K8s)

Only certain versions are actually published to Dockerhub.

To build, run:
```
cd server
./deploy-server.sh
```

# Image Location

Images are built and served through [Dockerhub](https://hub.docker.com/repository/docker/artielabs/debezium-server/general)
```Dockerfile
FROM artielabs/debezium-server:2.2
# Your build
```