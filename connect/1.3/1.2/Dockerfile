FROM debezium/connect-base:1.2

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.2.1.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPO_INCUBATOR="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=9c9e1b6c9340b58c90c3d496ecb685bc \
    MYSQL_MD5=a0ef9df856a9fcffbd2f4a694d34bbc8 \
    POSTGRES_MD5=1da36a421fd17cc6b4fd8486c09d4a32 \
    SQLSERVER_MD5=ff3734cd844613f947c62c74bbfb307b \
    ORACLE_MD5=aabac41aa8c8ef2408f391062006412c \
    DB2_MD5=e6050c2a0a0d5f2a57cd86366f78b322

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-incubator db2 "$DEBEZIUM_VERSION" "$DB2_MD5"
