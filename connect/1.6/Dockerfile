FROM debezium/connect-base:1.6

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.6.0.CR1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=ed8dfd6ac6d942fc19d264d2973601e3 \
    MYSQL_MD5=4805532765f132b0ccaf141979a00d1b \
    POSTGRES_MD5=4d7b9fac19231a56b63ddb549e35eebd \
    SQLSERVER_MD5=9598fae72d3640e0707ff40e840e2ddb \
    ORACLE_MD5=b6b3eddc7a41e550e5db01f00bff7f2a \
    DB2_MD5=e82933c5f79754c229fa20b873246fbb \
    VITESS_MD5=8a32cc9763e1a2bf6b3862d0986d8dfb \
    SCRIPTING_MD5=8c2f35f1d4c17f1f43b33dc4ea92f7fe

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
