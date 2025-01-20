ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.1

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.1.0.Alpha1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=8ac6af61e964fa8a449c59f4d24330b7 \
    MYSQL_MD5=9c73d794220219129cdf42475d6b8059 \
    MARIADB_MD5=e95c18b537fc8f531337a98ff83527f6 \
    POSTGRES_MD5=c9a42a687fd79a4259cc9692efa0d965 \
    SQLSERVER_MD5=3f1e4d5c81b305962c984327cd894875 \
    ORACLE_MD5=27454062edea8a6b8870c6e3bba05314 \
    DB2_MD5=36dd1678d238c23e005b4c2717bbb523 \
    SPANNER_MD5=65486f939f9ec745647b29cdd56fcd49 \
    VITESS_MD5=2a24aef8b56cf41c7284bdc8b34ddd7c \
    JDBC_MD5=3358cb1f6fd9f5814926d8c9b28b8917 \
    INFORMIX_MD5=aab72f3c216bfe8109a143ba70aa271b \
    IBMI_MD5=19d37221eec970f70dfbea4ec54de814 \
    KCRESTEXT_MD5=fcbeb064d0c4710f5a247e6f8a08eadb \
    SCRIPTING_MD5=3efe860a1ab105f0cc872d782bd7b034

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
    docker-maven-download debezium-optional connect-rest-extension "$DEBEZIUM_VERSION" "$KCRESTEXT_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

