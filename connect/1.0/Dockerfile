FROM debezium/connect-base:1.0

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.0.1.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPO_INCUBATOR="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=b99e1c0517f7f02f2155494efbb6ee35 \
    MYSQL_MD5=06ca6933da4b03c97b13b17df3ce6ad5 \
    POSTGRES_MD5=bed9bb3fff7c68e1aadff8768c232b77 \
    SQLSERVER_MD5=98a6e2a3c3462e5a3c8ed7cb2536bc62 \
    ORACLE_MD5=c5f8093ff3e1affe509ddffc3bd5fbb7

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5"
