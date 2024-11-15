ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.0

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.0.2.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=e92b3a0aa8a0983a5b72520923922576 \
    MYSQL_MD5=e7bd7072ae729b3501c72e9980bc519d \
    MARIADB_MD5=51de4b20eda8822509e5d8f0cb4027b8 \
    POSTGRES_MD5=1dc418a514392dcb26184d5f5f90a600 \
    SQLSERVER_MD5=78f76a8788712fb9462c9cfb89807335 \
    ORACLE_MD5=ad868e467621614996e2616c3382e05d \
    DB2_MD5=60872cc9a31203f813006ced326af815 \
    SPANNER_MD5=e248bee54e3f04f05c86125d0fcd5cd7 \
    VITESS_MD5=5fd530418a452cd5e5669365a339de66 \
    JDBC_MD5=4b6937b7fdcd097bde87c5f5b31bd8db \
    INFORMIX_MD5=f31ce089bfe98a3642034861f7fcaa53 \
    IBMI_MD5=aeaa32a98c065473ab3dbfd72cbf3c6b \
    KCRESTEXT_MD5=83b17b3ee4e77911730bbd7ced307fdc \
    SCRIPTING_MD5=db6ed37e2d32b9eb4007f1f93f43778e

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

