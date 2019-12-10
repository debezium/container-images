FROM debezium/connect-base:1.0

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.0.0.CR1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPO_INCUBATOR="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=330e09e58f41d5f22797072bbd74239b \
    MYSQL_MD5=5497a4dcab32154c33422f8d3091290d \
    POSTGRES_MD5=2948b8bdcf001e5482eab86e021f2108 \
    SQLSERVER_MD5=0ec2cf5d3359b5485bf279c40bc3f879 \
    ORACLE_MD5=d85063009d3df03ed7af8feda0bee7b1

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5"
