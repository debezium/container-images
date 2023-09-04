ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.3

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.3.3.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=90a8a0f32501f1dadecc7512692725c9 \
    MYSQL_MD5=227adb88a73f43be697782963a170e1c \
    POSTGRES_MD5=de0d3d1e15868d7381fa23b05b4d64bb \
    SQLSERVER_MD5=9264f484ee1a0626b6aeda7b00b80790 \
    ORACLE_MD5=d1d1d796e868dcb0e8bd8cd6ff518dfa \
    DB2_MD5=f2d759e3412d8f338785e24521bb9a73 \
    SPANNER_MD5=a2c4161413b3d6257716667b3406ddbd \
    VITESS_MD5=38ae4067f097937c15bc26ce28089ae9 \
    JDBC_MD5=daf2ee75de2611a71c4020ab3bc35f65 \
    KCRESTEXT_MD5=327277912df77dde27dc6974bf4ef8a7 \
    SCRIPTING_MD5=a99fcaf883121f8386863a388fdfd42e

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

