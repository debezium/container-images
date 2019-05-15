FROM postgres:9.6-alpine

LABEL maintainer="Debezium Community"
ARG USE_POSTGIS=true
ENV PLUGIN_VERSION=v0.9.5.Final

ENV WAL2JSON_COMMIT_ID=92b33c7d7c2fccbeb9f79455dafbc92e87e00ddd

ENV POSTGIS_VERSION=2.4.4

RUN apk add --no-cache protobuf-c-dev

RUN if [ "$USE_POSTGIS" != "false" ]; then \
        apk add --no-cache --virtual .debezium-build-deps autoconf automake curl file gcc git libtool make musl-dev pkgconf tar \
        && apk add --no-cache json-c libxml2-dev \
        && apk add --no-cache --repository 'http://dl-cdn.alpinelinux.org/alpine/edge/main' \
            --repository 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' \
            gdal-dev geos-dev proj4-dev \
        && curl -fSL "https://github.com/postgis/postgis/archive/${POSTGIS_VERSION}.tar.gz" >postgis.tar.gz \
        && mkdir postgis \
        && tar -xf postgis.tar.gz -C postgis --strip-components=1 \
        && (cd /postgis && ./autogen.sh && ./configure && make && make install) \
        && rm -rf postgis postgis.tar.gz \
        && apk del .debezium-build-deps; \
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
COPY postgresql.conf.sample /usr/local/share/postgresql/postgresql.conf.sample

# Copy the script which will initialize the replication permissions
COPY /docker-entrypoint-initdb.d /docker-entrypoint-initdb.d
