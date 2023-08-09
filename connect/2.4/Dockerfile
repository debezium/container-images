ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.4

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.4.0.Alpha2" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=e1f4a425f06ab2e416cac93ca7e71f75 \
    MYSQL_MD5=584a3969b672f3d58093a6c7f2594af2 \
    POSTGRES_MD5=9d7865bc50c9268fdabfd910e3c1bc3b \
    SQLSERVER_MD5=26466e0c2e011259ea7378ba8848ed8c \
    ORACLE_MD5=949e223990235b9036fea8d8b23ba3c2 \
    DB2_MD5=9405fc22efd1d484478ad6a85390570a \
    SPANNER_MD5=390d5c67b9113fd013dc3ea5fed24c7c \
    VITESS_MD5=6b138f2d041261eb6b64fd1b7a400086 \
    JDBC_MD5=bbeae977458e2282609f19323ba78d7e \
    KCRESTEXT_MD5=3b27a3d01c676d75a207f6c05c4ebf35 \
    SCRIPTING_MD5=01c8b3248263209d3f5f080ae628aeef

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

