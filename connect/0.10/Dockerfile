FROM debezium/connect-base:0.10

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="0.10.0.CR1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPO_INCUBATOR="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=22ca9566d15a4f35e759e84f3767d3fc \
    MYSQL_MD5=fffa3f19b7c3cb8c7ecc06b6b1850b18 \
    POSTGRES_MD5=c5b920c79d8e96cbab9bac9cc733cdb9 \
    SQLSERVER_MD5=919cc7280bf51e0492600777c9e3fbf0 \
    ORACLE_MD5=aa90232c394b290a6511b0a85bbb863b

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5"
