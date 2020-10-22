FROM debezium/connect-base:1.4

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.4.0.Alpha1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=e7467586ef88729cb5be252be0711b96 \
    MYSQL_MD5=8c19797c70b7c485baf122bfeee60f31 \
    POSTGRES_MD5=e27a962697f39623f8f0fb57dd907f63 \
    SQLSERVER_MD5=b8d92da0fa0bcc8ab9e90f058782e73c \
    ORACLE_MD5=4c867bbbfcbcc8174a8738f8692d9835 \
    DB2_MD5=15fbcbdfb60e5ab3d99334797d6a35c3 \
    VITESS_MD5=c593d5c936f6403523bcce3bb8233ddd \
    SCRIPTING_MD5=71100905e089bf603c96f7bbc88841fd

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-additional incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional incubator db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
