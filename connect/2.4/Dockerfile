ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.4

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.4.0.Beta1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=0c25356934610764fe2a4db6f753ba60 \
    MYSQL_MD5=ec527097ea11edb8938278c88da9e4c4 \
    POSTGRES_MD5=b1d770e7f76587b8fc50ec972d0348b5 \
    SQLSERVER_MD5=54663b460e9e7198317e58eefa583899 \
    ORACLE_MD5=dc4a72eca8a3c64726a2690e0cbbcc17 \
    DB2_MD5=a06b5eb6d86ce89736ff46c7fa52f8eb \
    SPANNER_MD5=08e62ba1489c793416db9e859257d34b \
    VITESS_MD5=2afd18d3f85c98639d067d8bec8c1f9d \
    JDBC_MD5=6579ec33ba2dce6ac09f598c1e8286ba \
    KCRESTEXT_MD5=1e2058b47fc3347ff4d0adba7477e63f \
    SCRIPTING_MD5=0972374b7bafa497aa7f07888552c109

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

