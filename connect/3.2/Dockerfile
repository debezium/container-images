ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.2

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.2.1.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=cd1e96a83132ec489b21437c115fd012 \
    MYSQL_MD5=fe285f3bb1acc0f7116efcd9e65b04b3 \
    MARIADB_MD5=bf84ca598fb4a09833b97dac84804db5 \
    POSTGRES_MD5=9ab417e37bee225e8440862749c755dd \
    SQLSERVER_MD5=f8da1fc874849f421e46fed2a17a04d9 \
    ORACLE_MD5=04ab3cc7450a10b4e4ec921575c03012 \
    DB2_MD5=3627a200b4931ba8ed0452970413efa9 \
    SPANNER_MD5=449cd25ab17cadc6cd9268f5a2f0de3c \
    VITESS_MD5=709469c720296af3658a1c4432846152 \
    JDBC_MD5=3b7889457e63138ddf80954665e7c26c \
    INFORMIX_MD5=6257b98e32ab620876ceed697e70ec44 \
    IBMI_MD5=050654824397d248fb586136058d1287 \
    SCRIPTING_MD5=6afda020b3432fcb7f17e3ed814dbf13

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium mariadb "$DEBEZIUM_VERSION" "$MARIADB_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium jdbc "$DEBEZIUM_VERSION" "$JDBC_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional spanner spanner "$DEBEZIUM_VERSION" "$SPANNER_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-additional informix informix "$DEBEZIUM_VERSION" "$INFORMIX_MD5" && \
    docker-maven-download debezium-additional ibmi ibmi "$DEBEZIUM_VERSION" "$IBMI_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

