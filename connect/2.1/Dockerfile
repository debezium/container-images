ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM debezium/connect-base:2.1

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.0.0.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=791bd20687aa3b2d1edfe951f8437520 \
    MYSQL_MD5=8d1911732f298484572199de423f6c7b \
    POSTGRES_MD5=02cdddbfe5cd2555b66dafe0ddfb8237 \
    SQLSERVER_MD5=36f9a98d33ca691ff8774f43cf8257ff \
    ORACLE_MD5=2ff310589236a823614a95ec0ce15467 \
    DB2_MD5=42ec53aa26ff6626a7a2a67cdc9a2223 \
    VITESS_MD5=f45966b21a4d548108cd4006421406cb \
    SCRIPTING_MD5=44a85ea8f0c502fa74f4ee516d331728

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
