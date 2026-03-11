License should be accepted:

    ENV LICENSE=accept




docker buildx build \
    --platform "linux/amd64,linux/arm64" \
    --progress=plain \
    -t debezium-informix:14 .


docker buildx build \
    --progress=plain \
    -t debezium-informix:14 .