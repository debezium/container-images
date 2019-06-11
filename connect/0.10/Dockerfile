FROM debezium/connect-base:0.10

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="0.10.0.Beta1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPO_INCUBATOR="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=865649ca5e756224aab535482c8dbaa5 \
    MYSQL_MD5=bdc4c04d15a7414151bce8647130645e \
    POSTGRES_MD5=9342ef4ff4622b992e4d5cc86276569c \
    SQLSERVER_MD5=da9441197f80bd475f6fc04a7a7ab9c4 \
    ORACLE_MD5=3046ed4edb9f1533578abda017271e23

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5"
