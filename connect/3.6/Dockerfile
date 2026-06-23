ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.6

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.6.0.CR1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=28f8c95d2d975b91cabb2ee8bebd3f94 \
    MYSQL_MD5=3b0a4a80db94155a735b18ff41022bbc \
    MARIADB_MD5=7d515b46a86c3be3f74e758487efe991 \
    POSTGRES_MD5=4c45d0f841ae03a7d8cbabe0c6c1cebf \
    SQLSERVER_MD5=c148f9f2440122a445790853cd17b730 \
    ORACLE_MD5=9c3879c6355d2159c7c77459396190da \
    DB2_MD5=e4ab23cd37d71d9804258f42859a0dd3 \
    SPANNER_MD5=1796fee5bcfaa27937f72ae257b02cff \
    VITESS_MD5=a9542efa5742b3d6577e656cd84179a4 \
    JDBC_MD5=88d5241e46bed5d320f07e925a6b7853 \
    INFORMIX_MD5=556324b624276254ab9eff0411205d14 \
    IBMI_MD5=c6d3443fdf91e4aeaf547a4970df64a5 \
    COCKROACHDB_MD5=5815ff94b991e796858c24534e8c1fa2 \
    SCRIPTING_MD5=e1710b85f4e0d5c3499ed32dc4475482 \
    CHRONICLE_QUEUE_MD5=cbfd7158bbd9dc65e235ffc65e3ef56e

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium mariadb "$DEBEZIUM_VERSION" "$MARIADB_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium jdbc "$DEBEZIUM_VERSION" "$JDBC_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional spanner spanner "$DEBEZIUM_VERSION" "$SPANNER_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-additional informix informix "$DEBEZIUM_VERSION" "$INFORMIX_MD5" && \
    docker-maven-download debezium-additional ibmi ibmi "$DEBEZIUM_VERSION" "$IBMI_MD5" && \
    docker-maven-download debezium-additional cockroachdb cockroachdb "$DEBEZIUM_VERSION" "$COCKROACHDB_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5" && \
    docker-maven-download debezium-store storage-chronicle-queue "$DEBEZIUM_VERSION" "$CHRONICLE_QUEUE_MD5"

