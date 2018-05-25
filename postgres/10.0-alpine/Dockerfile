FROM postgres:10.0-alpine

MAINTAINER Debezium Community
ARG USE_POSTGIS=true
ENV PLUGIN_VERSION=v0.7.5
ENV WAL2JSON_COMMIT_ID=f68cb0096c669a2ee5a2d32b54a535513e3cb23b

RUN apk add --no-cache protobuf-c-dev

RUN if [ "$USE_POSTGIS" != "false" ]; then \
        apk add --no-cache --repository 'http://dl-cdn.alpinelinux.org/alpine/edge/main' json-c \
        && apk add --no-cache --repository 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' \
            postgis-dev proj4-dev; \
    fi

# Compile the plugins from sources and install
RUN apk add --no-cache --virtual .debezium-build-deps gcc git make musl-dev pkgconf \
    && git clone https://github.com/debezium/postgres-decoderbufs -b $PLUGIN_VERSION --single-branch \
    && (cd /postgres-decoderbufs && make && make install) \
    && rm -rf postgres-decoderbufs \
    && git clone https://github.com/eulerto/wal2json -b master --single-branch \
    && (cd /wal2json && git checkout $WAL2JSON_COMMIT_ID && make && make install) \
    && rm -rf wal2json \
    && apk del .debezium-build-deps

# Copy the custom configuration which will be passed down to the server (using a .sample file is the preferred way of doing it by 
# the base Docker image)
COPY postgresql.conf.sample /usr/share/postgresql/postgresql.conf.sample

# Copy the script which will initialize the replication permissions
COPY /docker-entrypoint-initdb.d /docker-entrypoint-initdb.d
