FROM debezium/connect-base:1.3

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.3.0.Beta1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPO_INCUBATOR="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=dd8bedde1ac94c6be9a793db4c2164b3 \
    MYSQL_MD5=bac22e9379f03b95bfd73bd07f481faf \
    POSTGRES_MD5=df645ebc7ab3476c32279cff5c71b0cd \
    SQLSERVER_MD5=f073b4d7b5ccbc5f1f906d5a59821ec4 \
    ORACLE_MD5=b7125e8b6a6ad5c1a21be206fcb638f3 \
    DB2_MD5=cb0cbac333e4172831c77dd1413d37fe

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-incubator db2 "$DEBEZIUM_VERSION" "$DB2_MD5"
