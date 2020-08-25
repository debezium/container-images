FROM debezium/connect-base:1.2

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.2.2.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPO_INCUBATOR="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=f28ccfa0234517af32954979db03d45b \
    MYSQL_MD5=4cf5f20f7f3f731aefc92d9442df2802 \
    POSTGRES_MD5=502b1d3baac04539d6a912df4007884c \
    SQLSERVER_MD5=e25c7be3038d0deab05b74bfb5ecf03e \
    ORACLE_MD5=08998d3b34b0f659ff08bd820d97b718 \
    DB2_MD5=cfd77d1e909628351e5af7214794a14e

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-incubator db2 "$DEBEZIUM_VERSION" "$DB2_MD5"
