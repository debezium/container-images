FROM debezium/connect-base:2.0

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.0.0.Beta1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=634a68ed7c9cd0782b9e6b43d1081975 \
    MYSQL_MD5=63a8bb8e014055c4f76ea78775f688cb \
    POSTGRES_MD5=55740e283fcf8af87e4f3c325251af0c \
    SQLSERVER_MD5=549e51837ed4244bf0da03a6f90a7fa4 \
    ORACLE_MD5=5060cfdb0c2f5750ea11236abbb99107 \
    DB2_MD5=457280c3576689c22bb2dab2a78c1969 \
    VITESS_MD5=b49661025a040604b1fff3ddb6cc4fd4 \
    SCRIPTING_MD5=4e2653dfd291c94dd7be1778e49bf4b0

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
