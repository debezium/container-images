ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.7

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.7.0.Alpha2" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=83579f0082ab8d2dab114d2c82e9d501 \
    MYSQL_MD5=754dfe1c67a6a74d04c8ecb1be35602d \
    POSTGRES_MD5=94dbe6d5b1077f20d1e6c45287399599 \
    SQLSERVER_MD5=bb7a3a3a32b69a840504ca63783826ef \
    ORACLE_MD5=06e1dcb31c118dee864244bb8916e679 \
    DB2_MD5=f9f50f9fef4b528e4279ad217eb41520 \
    SPANNER_MD5=08f6e8a678c3e4a38f08cfbed064f42f \
    VITESS_MD5=a7f8b4a8fc9401577fa77e1f76b326c5 \
    JDBC_MD5=635174292b3c2d7224f6cbbbc9077b4f \
    INFORMIX_MD5=5302d42e43cbf70578b8110eea9ba112 \
    IBMI_MD5=ebc3307f7de2b92c576bbc8308046ba7 \
    KCRESTEXT_MD5=1f42d1837b1741c4f519e0c98f75a073 \
    SCRIPTING_MD5=5d15b8d3c57133f8bc2e133e32644747

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
    docker-maven-download debezium-additional ibmi ibmi "$DEBEZIUM_VERSION" "$IBMI_MD5" && \
    docker-maven-download debezium-optional connect-rest-extension "$DEBEZIUM_VERSION" "$KCRESTEXT_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

