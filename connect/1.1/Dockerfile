FROM debezium/connect-base:1.1

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.1.2.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPO_INCUBATOR="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=69cfc26b6a580a0e748f03fc8095bd72 \
    MYSQL_MD5=bb9d9e4402da79d1eac929544ba9c602 \
    POSTGRES_MD5=1d080f6e148e6a03816980207f3b2156 \
    SQLSERVER_MD5=a19f308e85d6ed0064f63090c8976318 \
    ORACLE_MD5=313d89746321470e7c3a7df071a2ce08 \
    DB2_MD5=68c942a7540a08e3b67a2a4f3e34ad4c

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-incubator db2 "$DEBEZIUM_VERSION" "$DB2_MD5"
