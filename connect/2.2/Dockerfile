ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.2

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.2.0.Alpha2" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=d0218fcda1380c867d24b1e584a572dc \
    MYSQL_MD5=89dade3a2f5f429a8e7929ebf371999d \
    POSTGRES_MD5=075d2217cd5565ba181d87898298f6f3 \
    SQLSERVER_MD5=ceca9748be0e83ca5b74c9452cd7cebb \
    ORACLE_MD5=890b22ba82eb6c4e7fb8d070826f54ee \
    DB2_MD5=04a4da28666f69d4546421767b507360 \
    SPANNER_MD5=76a78e300328c7f24a99c436f91e95b6 \
    VITESS_MD5=fa95e1adf5fbefc239ee3db103128d64 \
    KCRESTEXT_MD5=e7ba6bff512a047202ec805052f79dc7 \
    SCRIPTING_MD5=002bd087618cb84b2b9ad74fc98d4e62

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional spanner spanner "$DEBEZIUM_VERSION" "$SPANNER_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional connect-rest-extension "$DEBEZIUM_VERSION" "$KCRESTEXT_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

