FROM debezium/connect-base:1.3

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.2.0.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPO_INCUBATOR="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=0e68286ec4a7b184d8333ecf4ab63986 \
    MYSQL_MD5=722154d0bb4edf236714996c0afd5d8a \
    POSTGRES_MD5=168c8b91c24a50ca68e28620ab8303aa \
    SQLSERVER_MD5=73e741fa815471c5f6e1d7e216b43317 \
    ORACLE_MD5=b8758c468861dd18b0d1f672aa934bae \
    DB2_MD5=3a493e7d7a551439f75fa203acc86653

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-incubator db2 "$DEBEZIUM_VERSION" "$DB2_MD5"
