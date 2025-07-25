FROM mirror.gcr.io/library/postgres:13-alpine

LABEL maintainer="Debezium Community"
ENV PLUGIN_VERSION=v3.2.0.Final

ENV WAL2JSON_COMMIT_ID=wal2json_2_3

RUN apk add --no-cache protobuf-c-dev

# Compile the plugins from sources and install
RUN apk add --no-cache --virtual .debezium-build-deps gcc clang19 llvm19 git make musl-dev pkgconf \
    && git clone https://github.com/debezium/postgres-decoderbufs -b $PLUGIN_VERSION --single-branch \
    && (cd /postgres-decoderbufs && make && make install) \
    && rm -rf postgres-decoderbufs \
    && git clone https://github.com/eulerto/wal2json -b master --single-branch \
    && (cd /wal2json && git checkout $WAL2JSON_COMMIT_ID && make && make install) \
    && rm -rf wal2json \
    && apk del .debezium-build-deps

# Copy the custom configuration which will be passed down to the server (using a .sample file is the preferred way of doing it by 
# the base Docker image)
COPY postgresql.conf.sample /usr/local/share/postgresql/postgresql.conf.sample

# Copy the script which will initialize the replication permissions
COPY /docker-entrypoint-initdb.d /docker-entrypoint-initdb.d
