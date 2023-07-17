ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM localhost:5500/debeziumquay/connect-base:2.4

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.4.0.Alpha1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=8f6ffefded841791542ffa10abc3780e \
    MYSQL_MD5=0cc6205721c989bf4f9e4398160fc400 \
    POSTGRES_MD5=133a87d98cc89d25d5f819ab317237db \
    SQLSERVER_MD5=e5bcecb969f4e26df07b0001aa154297 \
    ORACLE_MD5=0c59c303919cee55672004347197a50f \
    DB2_MD5=7317d8e787aeffb40c99ae3683826621 \
    SPANNER_MD5=3215c763626d311ac2500165d0096e17 \
    VITESS_MD5=8e315d7439127e0fee863512810a7707 \
    JDBC_MD5=15f24389494cc884a2b83206380744f1 \
    KCRESTEXT_MD5=cba0fd70e83419e83d1edb52648308b2 \
    SCRIPTING_MD5=60c2dd70cf07a7fda10f27cc95a32c10

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

