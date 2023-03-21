# Building Debezium Docker Images

Starting with version 1.9 Debezium provides multi platform Docker iamges for `linux/amd64`
and `linux/arm64`. 
Debeziums own Postgres and MongoDB builds are also available as multi platform, as long
as their base images support multi platform builds (see `build-all-multiplatform.sh`).

## Running the build

You can build Debezium, Mongo and Postgres multi platform images using the `build-all-multiplatform.sh` script.

Before running the build, you need a `buildx` instance configured. You can create an instance like this:

```bash
docker buildx use
```

Depending on your platform and Docker setup, you also might need to setup qemu emulators yourself. 
Please checkout the official docs for more informations: 
https://docs.docker.com/build/building/multi-platform/#building-multi-platform-images.

You can provide the Debezium version(s) that should be build using the env variable `DEBEZIUM_VERSIONS`:

```bash
export DEBEZIUM_VERSIONS="1.9 2.0"

./build-all-multiplatform.sh
```

* **Note:** Images by default are pushed only to [quay.io](https://quay.io/).
For testing purposes, you can change this behaviour (see below).

## Running the x86 build only

For compatibility reasons, Debezium versions before 1.9 can be build using the "old" `build-all.sh` script,
that builds single platform images without buildx.

## Configuring the build for (local) testing

You can specify two environment variables that control where the images are pushed to after build:

* `DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME`: name of the first registry to use. This defaults to `quay.io/debezium`, so that the images are pushed to the Quay.io Registry.
* `DEBEZIUM_DOCKER_REGISTRY_SECONDARY_NAME`: name to use for the second registry. By default it's not set and if not set, images are pushed only to `DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME`.

To run the build locally you can modify these variables.

For example, you can run a [local registry](https://docs.docker.com/registry/deploying/)
and deploy the images to your local registry.

To do so, run the local registry as described in the link above. You can also run the `docker-compose` file from the `local-registry` folder, that
sets up a local registry on http://localhost:5500 and also runs a web browser for
that registry on http://localhost:5580:

```bash
docker-compose -f local-registry/docker-compose.yml up -d
``` 

Then set the env variable:

```
export DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME=localhost:5500/debezium
```
Where `localhost:5500` is the port your registry listens to.

To use the local registry you need to configure your `buildx` instance to make
sure you're using a host network. You also need a config file that 

```
docker buildx create --driver-opt network=host --use --name my-local-builder
```

For simplicty, you can run the `./setup-local-builder.sh` script, that creates an
appropriate runner. Note that the scripts expects the registry listening on http://localhost:5500.

## Building single images

You can build a single images running either `./build-mongo-multiplatform.sh`  or `./build-postgres-multiplatform.sh`

Both of this scripts works with the env variables described above and expect two arguments:

1. Version to be build
2. Platform(s) to be build for example `linux/amd64,linux/arm64`

Examples:

```bash
    ./build-postgres-multiarch.sh 14-alpine "linux/amd64,linux/arm64"
    ./build-mongo-multiarch.sh 3.2 "linux/amd64"
```

For building a single Debezium version for multiple platforms, you can run
`./build-debezium-multiplatform.sh`. This scripts expects one parameter with 
the Debezium version. Note that the minimum Debezium version that supports this
build is `1.9`.

