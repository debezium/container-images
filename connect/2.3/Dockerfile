ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.3

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.3.0.Beta1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=1c4db042be1041fd955f0753eff4fd22 \
    MYSQL_MD5=8f45b585ec9ae629af5ffa5e4d3aeb59 \
    POSTGRES_MD5=7b11a7bed9fd97332e2e8caa72b89f31 \
    SQLSERVER_MD5=6232f06d9dfa92e6fd5fa4e25fcd2703 \
    ORACLE_MD5=5733eb1e64ec616e1f76c58d46ed7a03 \
    DB2_MD5=1fcb227eb5900aba7d736b1d96f36f22 \
    SPANNER_MD5=fb0d6e5c78c9bbda3751e1ec7489df00 \
    VITESS_MD5=4b2c893cff86ae5f15bf2b676704833b \
    JDBC_MD5=e02e6b62fae5f7d45a6f1c5afcdb0313 \
    KCRESTEXT_MD5=a13c820a486ca0d3b14d1ff0a31205ad \
    SCRIPTING_MD5=f72f84ad51e05907d1485933c155df85

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

