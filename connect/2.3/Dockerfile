ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.3

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.3.5.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=b90b52e643b94938fb493f7d2a2ca4f4 \
    MYSQL_MD5=42295b860383b96f924eedc1bd726681 \
    POSTGRES_MD5=f3cbed0945cdcf95879a2fe4afc76ec5 \
    SQLSERVER_MD5=110932881c359341effc95f5209c371e \
    ORACLE_MD5=85b92901a6e95aa05620fc035300dc50 \
    DB2_MD5=063e7fbecf81ce5d7cf0fbaefa349b34 \
    SPANNER_MD5=c70eed8b485b8c96c4598f832eebc37f \
    VITESS_MD5=1b1177a92f276f788057dfeac19254ea \
    JDBC_MD5=94146868278b55b54e6593f094c50162 \
    KCRESTEXT_MD5=ef81f705dad2c30590d6a2e513e31b35 \
    SCRIPTING_MD5=a5e5725ba7e84e910c8b9f808351a464

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

