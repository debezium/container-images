ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.5

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.5.4.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=9d9b92b600ec54d248f4657ac33692d9 \
    MYSQL_MD5=be1c891938721d26893b88f95e497582 \
    POSTGRES_MD5=8812d2336d876f474103e7079cc82a31 \
    SQLSERVER_MD5=2a18084261646e8d3adf6cc49740128a \
    ORACLE_MD5=73c7f55e91eec7aee635e26a7d70f667 \
    DB2_MD5=f8540f1109abaa47137103012c26e5b7 \
    SPANNER_MD5=58cab861ba1c0200387671c885996b8f \
    VITESS_MD5=b60f09180618b6a8f6d8b7dbd2877a6c \
    JDBC_MD5=983023b5aa4caa87a8c40d3e61c9c8ac \
    INFORMIX_MD5=cf6371c59b654dd1e61e447f5106cbff \
    KCRESTEXT_MD5=6e3aa7b2fc5c6b10dde6bf52f89f15c7 \
    SCRIPTING_MD5=77d8ad3f7155dd5f7709f858b80c5f9f

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional jdbc jdbc "$DEBEZIUM_VERSION" "$JDBC_MD5" && \
    docker-maven-download debezium-additional spanner spanner "$DEBEZIUM_VERSION" "$SPANNER_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-additional informix informix "$DEBEZIUM_VERSION" "$INFORMIX_MD5" && \
    docker-maven-download debezium-optional connect-rest-extension "$DEBEZIUM_VERSION" "$KCRESTEXT_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

