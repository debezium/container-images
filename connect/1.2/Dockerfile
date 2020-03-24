FROM debezium/connect-base:1.2

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.1.0.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPO_INCUBATOR="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=3057ddeea1944c9364712ef1ee40a3f9 \
    MYSQL_MD5=2da532479e5d765ca61abc75676357e4 \
    POSTGRES_MD5=cbd6e05f7fb58a6dab2e33845be07881 \
    SQLSERVER_MD5=2bd1936b4f377814b9206b73e5824967 \
    ORACLE_MD5=a8de42e04d32b45329f780884534ff9b \
    DB2_MD5=5fbcb7bb3f9bca4749dda3b6290e09c6

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-incubator db2 "$DEBEZIUM_VERSION" "$DB2_MD5"
