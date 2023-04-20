ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.3

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.2.0.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=c89a5576a2128fec5c02ee547cc48362 \
    MYSQL_MD5=feda687fbcf233e8d7751353841aef7e \
    POSTGRES_MD5=afa087fdecb9d65156a21f1ce65ac1c1 \
    SQLSERVER_MD5=7258a81a439cfe8f193c01d798597ad1 \
    ORACLE_MD5=750cefc0318df5eead6ca95b21c5ea08 \
    DB2_MD5=cc073e16a681415ca15991217154c86f \
    SPANNER_MD5=5d445aff81f820eb47c944bcf79ffea3 \
    VITESS_MD5=610ab3a6dae079c5bb94173cf9d5b21e \
    JDBC_MD5=f422b271f44ae16e97b40c26b90c9f68 \
    KCRESTEXT_MD5=a17c2dd86e979d573b42feef2446666d \
    SCRIPTING_MD5=ebc903522c7a3b46abf4c36539887f56

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional jdbc jdbc "$DEBEZIUM_VERSION" "$JDBC_MD5" && \
    docker-maven-download debezium-additional spanner spanner "$DEBEZIUM_VERSION" "$SPANNER_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional connect-rest-extension "$DEBEZIUM_VERSION" "$KCRESTEXT_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

