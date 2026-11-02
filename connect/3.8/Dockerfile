ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.8

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.8.0.Alpha1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=8ec09b67d6589634d205259d8fdca27a \
    MYSQL_MD5=bf02c1417aa45e2fdec5850d3067897a \
    MARIADB_MD5=819397298e583e4c73e28c5fc6334595 \
    POSTGRES_MD5=451f0a26288588e8ef0ffd661ca05b5a \
    SQLSERVER_MD5=80050add90226f641e066ce236c703fd \
    ORACLE_MD5=6003c1fe95bf086d2715459a887a8074 \
    DB2_MD5=ea929111707ec5b456411d2bb80c50e2 \
    SPANNER_MD5=3a380784eae5b930744da674574dd0f6 \
    VITESS_MD5=eef089139d944a5dcae1fefcb470cf9e \
    JDBC_MD5=6820e8e76289b87b57d2c930025509dc \
    ELASTICSEARCH_MD5=e7b90e209ad7dc205b080ba9425d38c9 \
    INFORMIX_MD5=58ba29b60c0f8a0bcc8f985a546d5375 \
    IBMI_MD5=1c15298f697427635d55d382b03e0b73 \
    COCKROACHDB_MD5=123cee5f4aeac6b88a3c93cd801d5e94 \
    SCRIPTING_MD5=27d55ad30342907bbc741a3d76f01a57 \
    CHRONICLE_QUEUE_MD5=bec5379843602c6a826c8c169d2cb778

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
    docker-maven-download debezium-additional elasticsearch elasticsearch "$DEBEZIUM_VERSION" "$ELASTICSEARCH_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5" && \
    docker-maven-download debezium-store storage-chronicle-queue "$DEBEZIUM_VERSION" "$CHRONICLE_QUEUE_MD5"

