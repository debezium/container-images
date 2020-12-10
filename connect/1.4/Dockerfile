FROM debezium/connect-base:1.4

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.4.0.Beta1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=0683c59cc9bb4e041629c5cb5ff24ee7 \
    MYSQL_MD5=5a0672b020a015425df46f9bb1fad871 \
    POSTGRES_MD5=124215ab939046eac9a518430bc39bb7 \
    SQLSERVER_MD5=b93c6281f0f6f74d17ce021dcdbe59f1 \
    ORACLE_MD5=7d104937ac1af17651881795ea9bb6a8 \
    DB2_MD5=98274ed3f45cd394cce8af5c11087176 \
    VITESS_MD5=81ea2a2b31c8852a02fd0fc2aec84743 \
    SCRIPTING_MD5=8ffdfa83440889f400606d2fb6d67352

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-additional incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
