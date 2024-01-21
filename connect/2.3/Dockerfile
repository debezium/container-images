ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.3

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.3.7.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=172a26afe154f3fe68dd0c29749be609 \
    MYSQL_MD5=ba04d15ec301bf5c8f084ef4e1e0172d \
    POSTGRES_MD5=be442fc694f16f0cafbd9517b57bd82a \
    SQLSERVER_MD5=b38a0b976a757bfa67b719c011ee6b52 \
    ORACLE_MD5=d9da21bc4d1933004f7fc9ad10acef6f \
    DB2_MD5=371ac4e8b0ebd184c36c4478d1ccd91b \
    SPANNER_MD5=4d5d6a8137dcd7bde61c8fd055ab4621 \
    VITESS_MD5=dfa1c2590b47d534fd0b8b70405d4514 \
    JDBC_MD5=dbf14cbd2b3da9465127bcfc5cdeefbb \
    KCRESTEXT_MD5=29efa6c1e3fa126b0d75cc0444fc867f \
    SCRIPTING_MD5=2630de8de4f10f70b046159c32100114

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

