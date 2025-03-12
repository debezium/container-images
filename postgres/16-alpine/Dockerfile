FROM mirror.gcr.io/library/postgres:16-alpine

LABEL maintainer="Debezium Community"
ENV PLUGIN_VERSION=v3.1.0.Beta1

RUN apk add --no-cache protobuf-c-dev

# Compile the plugins from sources and install
RUN apk add --no-cache --virtual .debezium-build-deps gcc clang19 llvm19 git make musl-dev pkgconf \
    && git clone https://github.com/debezium/postgres-decoderbufs -b $PLUGIN_VERSION --single-branch \
    && (cd /postgres-decoderbufs && make && make install) \
    && rm -rf postgres-decoderbufs \
    && apk del .debezium-build-deps

# Copy the custom configuration which will be passed down to the server (using a .sample file is the preferred way of doing it by 
# the base Docker image)
COPY postgresql.conf.sample /usr/local/share/postgresql/postgresql.conf.sample

# Copy the script which will initialize the replication permissions
COPY /docker-entrypoint-initdb.d /docker-entrypoint-initdb.d
