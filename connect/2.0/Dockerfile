FROM debezium/connect-base:2.0

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.0.0.Alpha2" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=7ffd59c2414ab9edd713388e9db6a3f2 \
    MYSQL_MD5=5d7a8dde2393a711adbcbfc8841d3afb \
    POSTGRES_MD5=dc3e45af2acc47dca5bbc2d9d38a018b \
    SQLSERVER_MD5=178ce60c1602a8fa47ac71c4bb3560d3 \
    ORACLE_MD5=9b7c925586ae491e8302fdf4d57d8002 \
    DB2_MD5=0fb8cefa6af676822129e60fafdb52ac \
    VITESS_MD5=a8cab71f04deec5ea01f6c324b8258e4 \
    SCRIPTING_MD5=7b8b20b8dfe6e1bc408a902c956ed764

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
