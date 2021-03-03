FROM debezium/connect-base:1.5

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.5.0.Beta1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=305f46abb1255b1174f54298b79b3b43 \
    MYSQL_MD5=56c555ceaaac455cf2025e0318fd8edd \
    POSTGRES_MD5=7020b56462509e5c083af519aaf25895 \
    SQLSERVER_MD5=869df62cb9493dbead3addfed374f3c6 \
    ORACLE_MD5=6d6847cfa6c5da4544a2ee02acb21bc0 \
    DB2_MD5=f623a9fca199c4572c79bf4e510461d0 \
    VITESS_MD5=cbff8bfa9f95bce7f035b98a52f58b04 \
    SCRIPTING_MD5=ffdaccedafcbfbb3f9b77892e8fb43f4

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
