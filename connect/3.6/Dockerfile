ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.6

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.6.0.Beta1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=c4718f227af60682cf9bfa6454f0e44f \
    MYSQL_MD5=f8e167886b27d9f80bf6d2179657bc7c \
    MARIADB_MD5=af20e7c4fdcb49d7a51bd9277a77d44e \
    POSTGRES_MD5=5f4ed0b2701f5e586244a705f41245a0 \
    SQLSERVER_MD5=4b3f94138efce3a01a72c4bb9c0c2c62 \
    ORACLE_MD5=6404843df0b51bb4f37f45229bc977c8 \
    DB2_MD5=0cf3ecf274380ea8ca3a2bd969f1b08d \
    SPANNER_MD5=9968f367375216d56a38befa1a649adf \
    VITESS_MD5=fca77f5369fcf36abd27f5d99b651899 \
    JDBC_MD5=2c757772eb7c1441d668ca4312191c7e \
    INFORMIX_MD5=d98b4b6f76c8b2ae6d74da1ec55be279 \
    IBMI_MD5=027a27b7c862070ef5722faac622901c \
    COCKROACHDB_MD5=439fcf74effd9916135652ab4fa8477e \
    SCRIPTING_MD5=a527e16883acba8a97272d0f1eee492a \
    CHRONICLE_QUEUE_MD5=3056132898dff06816e899b1454a04e5

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

