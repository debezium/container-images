FROM debezium/connect-base:1.9

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.9.3.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=d698c30a1c9ccde3b85b753869f8e2ff \
    MYSQL_MD5=5734dc2be40951b169f7fb2afcd1cbf5 \
    POSTGRES_MD5=bcd0acb25633d23af4ac5e0f3aed6c1f \
    SQLSERVER_MD5=4d5c7c3b410a0c5b2f69474c73fda442 \
    ORACLE_MD5=9091d8d6875d166cfcdec2887af39e76 \
    DB2_MD5=7a4a8a5b938bf523d9c8fe30ac8ed7d9 \
    VITESS_MD5=ba4b0e27759c9f43a7d619daa315c6b6 \
    SCRIPTING_MD5=514fb8e29d31d1f060b6bd9de1d9a0e4

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
