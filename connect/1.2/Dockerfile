FROM debezium/connect-base:1.2

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.2.0.CR2" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPO_INCUBATOR="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=f5129e60f54249e46b8ee301d5dba11d \
    MYSQL_MD5=29cb2038026f22c9ff8f46ca8ee7c0cf \
    POSTGRES_MD5=62a6c6ce45ba5d26486d0c7e32688f6f \
    SQLSERVER_MD5=4931c1c27be16b449abe30490df0c797 \
    ORACLE_MD5=c58ec100c5db4850b6e1150ac121894c \
    DB2_MD5=8c8c68e767cdee845e396559d3be19cd

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-incubator db2 "$DEBEZIUM_VERSION" "$DB2_MD5"
