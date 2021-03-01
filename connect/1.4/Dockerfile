FROM debezium/connect-base:1.4

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.4.2.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=fa308f6fb6f570bdd1e2d8a329c9d9a6 \
    MYSQL_MD5=5321bbe1eb8450fecbc249abb28c9a29 \
    POSTGRES_MD5=39fcc96ba02533779921ba87c513811a \
    SQLSERVER_MD5=dd3ae950807a68295cfc9959031e8e84 \
    ORACLE_MD5=ccc96ff9736edcbd2910a57f9e119edb \
    DB2_MD5=df5d9da129b53aa1df4803adc09c12b7 \
    VITESS_MD5=38586ad6ad86a7ba3d1fce2cc6eec2a0 \
    SCRIPTING_MD5=ca4a61459c56c5cc53515dfb645951c7

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-additional incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
