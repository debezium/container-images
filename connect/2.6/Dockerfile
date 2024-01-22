ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.6

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.6.0.Alpha1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=3db73f49d29cbdea2fadae25dc1f4c25 \
    MYSQL_MD5=d9cdb254b6ff40b90733e0b61f12c666 \
    POSTGRES_MD5=56cde9af8e96993573387acc476a13aa \
    SQLSERVER_MD5=c5675545fde967b96c4d40a7bddf8aef \
    ORACLE_MD5=6ce4efeabeab0f90748a63bf43136436 \
    DB2_MD5=497e78f7e6216df7668aa1568679f72e \
    SPANNER_MD5=6ca2e311deaf131fa4d21071c73d4507 \
    VITESS_MD5=e9e9a3f2b957e5f38cb18d76a13c3e26 \
    JDBC_MD5=130ea8e005fe8247b878dda9842052a9 \
    INFORMIX_MD5=5f08f5956e56510f556461aa6de397fa \
    KCRESTEXT_MD5=d4ecade2c4c26f7304baafaab261da7d \
    SCRIPTING_MD5=0f56af6eb77be9c6e9f21849d9e69539

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

