FROM debezium/connect-base:0.10

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="0.10.0.Beta3" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPO_INCUBATOR="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=23558c16da63e3d5bfbcd4af1895ccbc \
    MYSQL_MD5=a6e8bf56e798fe69e6d157a77f7a09db \
    POSTGRES_MD5=3bceea33bfa93a500d3f9fb4695591fb \
    SQLSERVER_MD5=ef2aab82c088df0c1225acde935aa30f \
    ORACLE_MD5=68806d6054c8fd260a469b2c00248624

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5"
