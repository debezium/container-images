FROM debezium/connect-base:1.5

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.5.2.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=8d1ff76a38a5605b22118acde6ba8ba0 \
    MYSQL_MD5=14f63fb4a2d44a307be142ab697af5f3 \
    POSTGRES_MD5=8c314fc1f9c7bea53899d06d7e6fb2e2 \
    SQLSERVER_MD5=38a49bab735bf8b2047c9ec97a4e00aa \
    ORACLE_MD5=0d80e0f48e0882eeff48ed5936e4ef71 \
    DB2_MD5=a0357a12debd1fda33445f7a013adb61 \
    VITESS_MD5=5f8138d52781768f11591f39c3f9bf70 \
    SCRIPTING_MD5=35049cd9937c86ea0ec26267fd3ea9e3

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
