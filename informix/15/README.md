License should be accepted:

    ENV LICENSE=accept




docker buildx build \
    --platform "linux/amd64,linux/arm64" \
    --progress=plain \
    -t debezium-informix:15 .


docker buildx build \
    --progress=plain \
    -t debezium-informix:15 .




docker pull icr.io/informix/informix-developer-database:12.10.FC12W1DE