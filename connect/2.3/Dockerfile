ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.3

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.3.4.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=fb50f25d43983bfa7b639152ee86a027 \
    MYSQL_MD5=0edaba4dba83eb239f7a46716bb4b7df \
    POSTGRES_MD5=360045e21fb3715dc2a3eca360df281f \
    SQLSERVER_MD5=74a1796b59d6a3b3f8032604d7b33ab4 \
    ORACLE_MD5=d8fe46f8896c3f812cea9f975b209b99 \
    DB2_MD5=116a394617e8f82023a7328e13b89655 \
    SPANNER_MD5=7cb0f7124ce48fa74b95f894eeb453ca \
    VITESS_MD5=d78c58be8a57970cc221e830956b55ef \
    JDBC_MD5=a4c4e2d2e1e002ed055fbf3edbeeac79 \
    KCRESTEXT_MD5=e9820573baac824f33bc884253113931 \
    SCRIPTING_MD5=a539d7490d150fc1ca278aaf815e2632

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

