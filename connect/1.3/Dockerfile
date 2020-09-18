FROM debezium/connect-base:1.3

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.3.0.Beta2" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPO_INCUBATOR="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=542f95c9440825e3642087c392b46288 \
    MYSQL_MD5=3c3402fe7e98c93d3a0e69f34645d4e9 \
    POSTGRES_MD5=52b4870ac04aff2f29e386dda1811b51 \
    SQLSERVER_MD5=b0aed3afcd7dbfdf503e0e0a3af7de77 \
    ORACLE_MD5=d94f5a3fc1f68a58efcf7abf8639621f \
    DB2_MD5=c359cfb3119ac7b4a0882c8186c83d62 \
    SCRIPTING_MD5=e422bcc9d3cd4bcc48a210bc67f35805

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-incubator db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
