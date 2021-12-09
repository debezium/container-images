FROM debezium/connect-base:1.8

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.8.0.CR1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=fb851bf0a25b22a9b27719cf3895edac \
    MYSQL_MD5=97b7cf9540cd5dfda3fc1d305c19f192 \
    POSTGRES_MD5=d128307cb3e2c5776d260173ca4e59b8 \
    SQLSERVER_MD5=d12bfb2f6ff6b92196a2670a3e31d271 \
    ORACLE_MD5=8569a32a3b7a934f1ea6f822a021c2ff \
    DB2_MD5=ca3664f456277e6b1d8c74d34e7360f2 \
    VITESS_MD5=d0c8366d86074f9b3d0a0b85eefeab27 \
    SCRIPTING_MD5=226606980d6ad8313dca8237ff284fb1

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
