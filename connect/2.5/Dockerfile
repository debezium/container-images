ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.5

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.5.0.Beta1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=02edd55aaaec22b79021c37aa94e04f2 \
    MYSQL_MD5=02986b869b76eabb84d36fa5d240f16f \
    POSTGRES_MD5=5ec68e6fa4d224d2cc748716fb67b6cd \
    SQLSERVER_MD5=8f1521035f317e37f3aa7721348f75f6 \
    ORACLE_MD5=1adf249fac2d484271ed2e9a1f9ca887 \
    DB2_MD5=c7ec16d448d3b18ebad5808fa6fe641e \
    SPANNER_MD5=1ccae156dc7f30e063480591c9a67cfc \
    VITESS_MD5=05ef3cd5c45dd261c8dfb3250646b58f \
    JDBC_MD5=1fb7439909f589ee41ad5c6ffdb0be75 \
    INFORMIX_MD5=ac1e59e1a5cb7ef51f2000ad379c631b \
    KCRESTEXT_MD5=6cb69aff8ff3ab1b4c2fc61811b76f03 \
    SCRIPTING_MD5=be4d3c43b748d4d54838cea385799a23

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional jdbc jdbc "$DEBEZIUM_VERSION" "$JDBC_MD5" && \
    docker-maven-download debezium-additional spanner spanner "$DEBEZIUM_VERSION" "$SPANNER_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-additional informix informix "$DEBEZIUM_VERSION" "$INFORMIX_MD5" && \
    docker-maven-download debezium-optional connect-rest-extension "$DEBEZIUM_VERSION" "$KCRESTEXT_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

