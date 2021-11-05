FROM debezium/connect-base:1.7

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.7.1.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=18126ccb59e58fbc4f86764463e50295 \
    MYSQL_MD5=3a361982b23cb0607f0aabea7bfad7d4 \
    POSTGRES_MD5=3984fdd1b7f31c468312bf2ae3c786fe \
    SQLSERVER_MD5=8831f5cc6a492236b6a7af6dbbf56aef \
    ORACLE_MD5=55c8149a060a11adead260a92720744f \
    DB2_MD5=5b85f9fef607d703840abdcb1260375f \
    VITESS_MD5=11fb9269a65fd2138e2b3de76f4b413f \
    SCRIPTING_MD5=988f0746a08f908b4291fc62b11af155

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
