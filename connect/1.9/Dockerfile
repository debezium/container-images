ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:1.9

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.9.6.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=2d04f2ec13d8942707c22bcc83cc0948 \
    MYSQL_MD5=2676c8248b750d86db61d36addc364ea \
    POSTGRES_MD5=f7ce2a2b11f7cfbaa46a17596f190c09 \
    SQLSERVER_MD5=ec3c49673c19c55eb6f5de6318d8e826 \
    ORACLE_MD5=af68601a2378d1f13d7afc78b4605042 \
    DB2_MD5=9a093a514482b1f194c9a04d8caaad19 \
    VITESS_MD5=840af44c20c04184c327fb64d5d80507 \
    SCRIPTING_MD5=eb551228def512d4c971d014cde43e24

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
