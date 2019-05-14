#!/bin/bash

#
# Download connectors, verify the contents, and then install 
# into the `$KAFKA_CONNECT_PLUGINS_DIR/debezium` directory
#
set -e

CONNECTOR="$1"
CONNECTOR_MD5="$2"

DOWNLOAD_FILE="/tmp/plugin-${CONNECTOR}.tar.gz"

curl -fSL -o "$DOWNLOAD_FILE" \
    "$MAVEN_REPO_CORE/io/debezium/debezium-connector-$CONNECTOR/$DEBEZIUM_VERSION/debezium-connector-$CONNECTOR-$DEBEZIUM_VERSION-plugin.tar.gz"

echo "$CONNECTOR_MD5  $DOWNLOAD_FILE" | md5sum -c -

tar -xzf "$DOWNLOAD_FILE" -C "$KAFKA_CONNECT_PLUGINS_DIR"

rm -f "$DOWNLOAD_FILE"
