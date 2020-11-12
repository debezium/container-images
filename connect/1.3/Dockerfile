FROM debezium/connect-base:1.3

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.3.1.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=667fa8a508211b7294d122709ffb47be \
    MYSQL_MD5=d96da516d6fb2559336568c93f74eda2 \
    POSTGRES_MD5=02a489aa11424cd8233bac98f0da702e \
    SQLSERVER_MD5=6a832d2c94966366405d56763bc22d24 \
    ORACLE_MD5=bc5b5dc3745f775057f634ed9879ae7f \
    DB2_MD5=9318451f4b0b070f014b54f8ed1481ed \
    SCRIPTING_MD5=a951540b4514c54b240954088ccd242d

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-additional incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional incubator db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
