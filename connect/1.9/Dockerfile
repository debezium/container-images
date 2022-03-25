FROM debezium/connect-base:1.9

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.9.0.CR1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=bfc06c580e715da099ac1c5aac822a16 \
    MYSQL_MD5=ceb9a43ae761b979732a820b9c1e6f12 \
    POSTGRES_MD5=a3605c72962204c9995dc779649f29f9 \
    SQLSERVER_MD5=982f0fa7fcd21e18679dd166a1580cbe \
    ORACLE_MD5=64ebbe901b013c1767da0fc42de6fb23 \
    DB2_MD5=aeeaabc42d264f20ecc36be5030ea71d \
    VITESS_MD5=08f39d59815a18334f878331c5af74fa \
    SCRIPTING_MD5=1f149e37f91d188658c0c98b3cd74d6e

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
