ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.7

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.7.0.Alpha1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=6b5fefbfa569b9853417f2eac45dc2a5 \
    MYSQL_MD5=52065d79192ac5c13877ac9d747a7220 \
    MARIADB_MD5=0fd13b16d43bd338f45bca356a63bbb7 \
    POSTGRES_MD5=079c61d19b1f73cb4d2e244711134392 \
    SQLSERVER_MD5=9b68eb9a35ae8eee0eaef363e0299f49 \
    ORACLE_MD5=0f83fae1add817dd7824ad2c01429c34 \
    DB2_MD5=74e9c8134e42702440ae6eee0e5e5e44 \
    SPANNER_MD5=69a40ac6512387784cfc9d4f6fd21608 \
    VITESS_MD5=60f6421e64470b125671dfb165a9ac79 \
    JDBC_MD5=555ec17a157625f268310ef38a78ed71 \
    INFORMIX_MD5=3e245466250567ade9da0d12387e4bc5 \
    IBMI_MD5=c9115d9d0811688545c027bdd6f7465b \
    COCKROACHDB_MD5=cfc04aab8aad2b1396948dd8dddb48b7 \
    SCRIPTING_MD5=1218c4d3ef5144ea2fb2ec75b7bd5cb8 \
    CHRONICLE_QUEUE_MD5=1fb066da6a67c7c02962f59b4b8cd1ee

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

