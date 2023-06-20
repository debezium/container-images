ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM localhost:5500/debeziumquay/connect-base:2.4

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.3.0.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=35bbf2de9af6955493b1b1169744ce26 \
    MYSQL_MD5=fe6a3a93ac03880b6b6d09f6c9c6033c \
    POSTGRES_MD5=eefca8043e6aa1ccee5f20b9df76c248 \
    SQLSERVER_MD5=4db5569a84327043f64e1b25ac0d6df7 \
    ORACLE_MD5=fbb3d34cafa0ecb9629533e7d6812bf9 \
    DB2_MD5=9f4a556c780366e192044116e1302899 \
    SPANNER_MD5=b7741a87986167ac5baa160a46b4b50d \
    VITESS_MD5=c16c7f3f7bb6ef762ae52f704ef935e5 \
    JDBC_MD5=1bdbb0da1ecc0d2b1b2cf63273c52442 \
    KCRESTEXT_MD5=039b27d075b01ca1296efb6b185b0096 \
    SCRIPTING_MD5=f93f3a53773695d683712b504325530b

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional jdbc jdbc "$DEBEZIUM_VERSION" "$JDBC_MD5" && \
    docker-maven-download debezium-additional spanner spanner "$DEBEZIUM_VERSION" "$SPANNER_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional connect-rest-extension "$DEBEZIUM_VERSION" "$KCRESTEXT_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

