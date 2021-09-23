FROM debezium/connect-base:1.7

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.7.0.CR2" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=7663791dbb91ebacfb2d159fe44e9713 \
    MYSQL_MD5=d9db9c455ae7dd8b905ffb5db334de82 \
    POSTGRES_MD5=4e2cf64c422a33b831269455f0676008 \
    SQLSERVER_MD5=6965ea9516df061eb774dc8eef01e45e \
    ORACLE_MD5=901d1af9d807c6f950327689aaf28278 \
    DB2_MD5=95f0a18e2d6bb6824e471a07a38a5704 \
    VITESS_MD5=92cce8a84fa6d7667ce91abc6e655d43 \
    SCRIPTING_MD5=2ddb3372326c1694109425c6ba9713b2

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
