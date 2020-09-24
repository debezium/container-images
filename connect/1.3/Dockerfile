FROM debezium/connect-base:1.3

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.3.0.CR1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPO_INCUBATOR="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=fae97cd3a47119785e6d030eb8fae624 \
    MYSQL_MD5=e9b029c491df2ed3b6867dd5e196286b \
    POSTGRES_MD5=e077c54e4fd04402d4b0af1b31c5dbc4 \
    SQLSERVER_MD5=3df6e9c8d2ce02d6e5a405f59e82d6ef \
    ORACLE_MD5=945fec16b9a68c02f1f961b745b8a63c \
    DB2_MD5=f4fb408c48f4c553f5084026bc2f2f3f \
    SCRIPTING_MD5=ff4ac2c221f2697b77cda86b4b05a26d

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-incubator db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
