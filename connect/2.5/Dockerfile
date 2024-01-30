ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.5

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.5.1.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=43807de51c431a0eb56de795bd7a321e \
    MYSQL_MD5=eb881e72396ac05da698f3f4c7201923 \
    POSTGRES_MD5=b8d082fa4e63803db441c641c2269579 \
    SQLSERVER_MD5=2edf2a074162f2d6c455dedc36ffdc0e \
    ORACLE_MD5=529876251d68856aee1d1ac5f585faa1 \
    DB2_MD5=7dfde31a2388a2e91be6a7edcb33e42c \
    SPANNER_MD5=19bcc609e4f46355d7fd63bea42c4bdd \
    VITESS_MD5=76d3ce2e006ae78b1c61a5bf535bee59 \
    JDBC_MD5=67ceec4534a0db4f68ba5852ef1f7392 \
    INFORMIX_MD5=f0caba8221284433c0d0893b8d5daa70 \
    KCRESTEXT_MD5=2d67ed8f81052ba635623b03c61ce582 \
    SCRIPTING_MD5=da7f5e747cd89f7b562461c9c789326c

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

