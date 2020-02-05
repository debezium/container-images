FROM debezium/connect-base:1.1

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.1.0.Beta1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPO_INCUBATOR="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=aeed051cbd1649f9b17198e095eddce5 \
    MYSQL_MD5=e1f3953e434f279f59e22f33f07ceccf \
    POSTGRES_MD5=cfb5e532a73433e0054c0238c3940e13 \
    SQLSERVER_MD5=838ba20ec17d7dc7932951cbd7a2deb4 \
    ORACLE_MD5=4953e1d2cccd6bd3befb63bea042987a \
    DB2_MD5=0ab1439575525cc3d3b0b66251643d4e

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-incubator db2 "$DEBEZIUM_VERSION" "$DB2_MD5"
