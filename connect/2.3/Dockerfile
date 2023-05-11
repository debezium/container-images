ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.3

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.3.0.Alpha1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=d1deb473ea7d53f50fb6a37146b0ce91 \
    MYSQL_MD5=80064b6bdd461100a40eaf58aa307a41 \
    POSTGRES_MD5=b620c0d7e8662a61547653c405161bc5 \
    SQLSERVER_MD5=1ec6d6a9b3c453e9fef9ad0c677a42d2 \
    ORACLE_MD5=6ffb684975042fe05c076c6623825726 \
    DB2_MD5=bf9dac8bb758dbd0c5c80b4eb8fcf4d7 \
    SPANNER_MD5=3531cb6eaf6b74f9bd8867fe3568ad42 \
    VITESS_MD5=4a44fcbecf8fe4e7cec9b98f2667c609 \
    JDBC_MD5=cab22c06cdf02511258f5f7c84944176 \
    KCRESTEXT_MD5=b20d438af8243f33bd9b5d43352cf2bc \
    SCRIPTING_MD5=25747abcdcc429aff2aad287accf1673

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

