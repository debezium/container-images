FROM debezium/connect-base:1.1

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.1.1.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPO_INCUBATOR="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=0071931fe4e359d4785c473e1117c72c \
    MYSQL_MD5=8930fee8a22b00567f7998819c24f08d \
    POSTGRES_MD5=7c0a9f5f9ce03a1c00200392d5e7f09b \
    SQLSERVER_MD5=03728bc40e1d375e4a4cea1294f6cb42 \
    ORACLE_MD5=4ef6c6527ae902092bb49e00280ffd49 \
    DB2_MD5=8f776cc3610514dd5e575a1b01993abf

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-incubator db2 "$DEBEZIUM_VERSION" "$DB2_MD5"
