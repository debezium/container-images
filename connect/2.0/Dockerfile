FROM debezium/connect-base:2.0

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.0.0.Beta2" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=442b25f16cfc724d6cd9a65fb7814076 \
    MYSQL_MD5=ec4e045309cc636589b513b0abe37632 \
    POSTGRES_MD5=888366d644339867c0150e0deafcb5e4 \
    SQLSERVER_MD5=f4c56db70d2d40a974a9c80b7a96fb3e \
    ORACLE_MD5=aff753fa2acf0e90cbed67d47d695063 \
    DB2_MD5=2d49be4d56fab834ca42451c5a73ff2f \
    VITESS_MD5=4090702dc5978ff0942030de1105d828 \
    SCRIPTING_MD5=96572c42e5db37a7a2c7af079d77e988

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
