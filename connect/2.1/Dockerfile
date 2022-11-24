ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM debezium/connect-base:2.1

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.1.0.Alpha1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=09229a6237b03c00288d3cfc8ca55873 \
    MYSQL_MD5=488df110bdaff9573346ef4cb276bb0d \
    POSTGRES_MD5=72d7c3c919a3ff7a4aef8bcd51b5da28 \
    SQLSERVER_MD5=595ef46feb2874fe10b14b62ac620efc \
    ORACLE_MD5=5ca2c627b0f53b8db450d56accae5878 \
    DB2_MD5=f4529679c940c17c17414c05e4c8c744 \
    VITESS_MD5=ecc63f63af3f31e004f8d9100018f6d7 \
    KCRESTEXT_MD5=437df7873a5ffe7517ff4a630e9c9dcf \
    SCRIPTING_MD5=aa7b831b6813c9c066adeb2f9a9b09e9

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional connect-rest-extension "$DEBEZIUM_VERSION" "$KCRESTEXT_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

