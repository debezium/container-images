FROM debezium/connect-base:1.0

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.0.3.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPO_INCUBATOR="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=2c792f490b3746f09fe80c3c96518ac6 \
    MYSQL_MD5=3b0811df55076f32a8d82dce404aa489 \
    POSTGRES_MD5=12d168766e0c5359e12bcfdb6c4e986e \
    SQLSERVER_MD5=11c2d6712a779fa80ac29d48bf46a1f9 \
    ORACLE_MD5=0a362b926d03bc5b0a6913add95a7e34

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5"
