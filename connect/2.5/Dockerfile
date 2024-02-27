ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.5

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.5.2.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=c9fb7ad6c15bcf2076f85215176bb0c5 \
    MYSQL_MD5=f65237110b15ec7c4592400f6c815a8c \
    POSTGRES_MD5=d8469bc48682fc57d75e66547c42febb \
    SQLSERVER_MD5=e0bc6ea27df91d5a7cda466994da2885 \
    ORACLE_MD5=a48b06fe90612cfae246b9133be7a916 \
    DB2_MD5=549e4e8240da9b4fa3aa44e158eb384c \
    SPANNER_MD5=64ab2046d65ddbe2b978a51a0b0b83ed \
    VITESS_MD5=1046b7d1980a31b481c3e31ce4aa213b \
    JDBC_MD5=526c23cb1b2f809f1bb861644da0055b \
    INFORMIX_MD5=12ff3e9f9a2beda792dfc02dfe51cdde \
    KCRESTEXT_MD5=cbc4dac180f54b0fe2ac9b7f94b2ea4e \
    SCRIPTING_MD5=fdd39b70df022692b7b163a137311a67

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional jdbc jdbc "$DEBEZIUM_VERSION" "$JDBC_MD5" && \
    docker-maven-download debezium-additional spanner spanner "$DEBEZIUM_VERSION" "$SPANNER_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-additional informix informix "$DEBEZIUM_VERSION" "$INFORMIX_MD5" && \
    docker-maven-download debezium-optional connect-rest-extension "$DEBEZIUM_VERSION" "$KCRESTEXT_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

