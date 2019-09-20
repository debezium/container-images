# Image Syncer

[Debezium](https://debezium.io/) builds its images automatically in [Docker Hub](https://hub.docker.com/u/debezium).
This image serves for syncing the images into [Quay](https://quay.io/organization/debezium) Docker registry.

How to run
```
docker run -it -e DEST_CREDENTIALS='USER:PASSWORD' quay.io/debezium/sync-images
```
