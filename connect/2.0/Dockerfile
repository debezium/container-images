FROM debezium/connect-base:2.0

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.0.0.Alpha1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=d17072ff03028d106dc603995ce8a013 \
    MYSQL_MD5=3eb9553424dadbb40fb31f3c468b27da \
    POSTGRES_MD5=079f8104badd9de4f652e81a832f61ee \
    SQLSERVER_MD5=4013bcc1c0a0600deb90a3f1235af80c \
    ORACLE_MD5=f25c1dbe6cc632a98a690b3d95259de6 \
    DB2_MD5=76a85285857ba2e2888e94ee62a1714f \
    VITESS_MD5=5926295e9571680d200692b988c5a0c1 \
    SCRIPTING_MD5=235235762d7ddce98f42362aadecdebe

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
