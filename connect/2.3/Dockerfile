ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.3

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.3.0.CR1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=ca35a5e29536fbe0b23db8e64bef57d6 \
    MYSQL_MD5=6a3cb14829deaf716726990d3c6bbf1a \
    POSTGRES_MD5=a9c8ab3b13eeea177b8b4ecd71461f1b \
    SQLSERVER_MD5=c506f4d9dd8f10e6da09df6dcce9b707 \
    ORACLE_MD5=d1ed34adac1ba9f2d61c26a2e0918a05 \
    DB2_MD5=0b8bf251daafd7a7e4a75f1375174352 \
    SPANNER_MD5=983f29b602d9d02ca56b2a08dc3b80ca \
    VITESS_MD5=c97c2469c6e8e6e6d9e683d80ab58145 \
    JDBC_MD5=90ea56b92690a19798baa723193e211d \
    KCRESTEXT_MD5=04a4c68599a34a3ee977c4841115f727 \
    SCRIPTING_MD5=306d8b891f1bcd33a89b6e1c3f8f4bf6

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

