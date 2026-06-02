ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.5

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.5.2.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=aa10d13acb6f248cb859788aeddd93a8 \
    MYSQL_MD5=77d6b5cba2b94239383c083146dd6c82 \
    MARIADB_MD5=82eb6666be2331deb9807e2ca5711411 \
    POSTGRES_MD5=ecb55a2b72d096bc9e5a8bcc68c9b5d1 \
    SQLSERVER_MD5=c1d25460f8f181967afc30affe77313b \
    ORACLE_MD5=c6c675f76af42c09894a0fc603fb1564 \
    DB2_MD5=ca64b9ad49f3920e1392fdd8da703ef3 \
    SPANNER_MD5=9d96d6d4ecca803c87e120e872cf671f \
    VITESS_MD5=cb73b4d069a3b553d0153d12c4d96f80 \
    JDBC_MD5=6e236a517f865105e40bf1507b299111 \
    INFORMIX_MD5=9e9688748137acff293d9ce82f6d5ede \
    IBMI_MD5=6007039e95c1094ea799dcbb0a66311a \
    COCKROACHDB_MD5=8083f35ac2f3333df80461e1b6bdf2c5 \
    SCRIPTING_MD5=604207d563fd0fcc7a194beee499d7cb

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
    docker-maven-download debezium-additional cockroachdb cockroachdb "$DEBEZIUM_VERSION" "$COCKROACHDB_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

