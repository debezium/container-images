FROM mirror.gcr.io/library/postgres:17-alpine

LABEL maintainer="Debezium Community"
ENV PLUGIN_VERSION=v3.3.1.Final
ENV LLVM_VERSION=22

RUN apk add --no-cache protobuf-c-dev

# Compile the plugins from sources and install
RUN apk add --no-cache --virtual .debezium-build-deps gcc clang llvm git make musl-dev pkgconf \
    && export CLANG=clang-${LLVM_VERSION} LLVM_BINPATH=/usr/lib/llvm${LLVM_VERSION}/bin \
    && git clone https://github.com/debezium/postgres-decoderbufs -b $PLUGIN_VERSION --single-branch \
    && (cd /postgres-decoderbufs && make CLANG=clang-${LLVM_VERSION} LLVM_BINPATH=/usr/lib/llvm${LLVM_VERSION}/bin && make install CLANG=clang-${LLVM_VERSION} LLVM_BINPATH=/usr/lib/llvm${LLVM_VERSION}/bin) \
    && rm -rf postgres-decoderbufs \
    && apk del .debezium-build-deps

# Copy the custom configuration which will be passed down to the server (using a .sample file is the preferred way of doing it by
# the base Docker image)
COPY postgresql.conf.sample /usr/local/share/postgresql/postgresql.conf.sample

# Copy the script which will initialize the replication permissions
COPY /docker-entrypoint-initdb.d /docker-entrypoint-initdb.d
