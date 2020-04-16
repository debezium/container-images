FROM debezium/connect-base:1.2

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.2.0.Alpha1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPO_INCUBATOR="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=2c5ff839e7df3c6e1cebc91ad30804c1 \
    MYSQL_MD5=e02e76701cb4e299c9dc111c274bbc95 \
    POSTGRES_MD5=caa48a144c8ad378686c4f664a078e0d \
    SQLSERVER_MD5=fc70d2e167645e1beef88cb331e4adae \
    ORACLE_MD5=4af56d3f5240130e249be48b28f2a6ac \
    DB2_MD5=eb2fa440064ff951841396ef7c33d641

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-incubator db2 "$DEBEZIUM_VERSION" "$DB2_MD5"
