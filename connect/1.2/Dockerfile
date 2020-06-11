FROM debezium/connect-base:1.2

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.2.0.CR1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPO_INCUBATOR="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=1dbdb4beb9bd8a188918b7ac1ae88ba5 \
    MYSQL_MD5=09bd321723dcc00dacdd1e42026cfcb8 \
    POSTGRES_MD5=d807ae842904be91c1beee432aa91f37 \
    SQLSERVER_MD5=047393800334781e69ea7fcebfed17c8 \
    ORACLE_MD5=5a258d0297b8ef860ca7df70efe6740b \
    DB2_MD5=305ec391c1ab5b7229b4d50b47ab1c40

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-incubator db2 "$DEBEZIUM_VERSION" "$DB2_MD5"
