FROM debezium/connect-base:1.9

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.9.1.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=a91683947648b8843ec0a0b926d2bd4a \
    MYSQL_MD5=3f5e289a311ae88d7021a5301e882971 \
    POSTGRES_MD5=69821b79fb85b31aebf890cd107f28a0 \
    SQLSERVER_MD5=b1e0156de0b9bdbc2a43ac9869afc1a8 \
    ORACLE_MD5=d8585b733f9c11db940b3699ba92a472 \
    DB2_MD5=146a8ab574b0977c68ce9bac94e4734f \
    VITESS_MD5=320f0f4bce7da36cac332b8b4e8ddce2 \
    SCRIPTING_MD5=1b38b9e4c236011267f0d3e773980847

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
