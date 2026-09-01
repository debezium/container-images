ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.6

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.6.2.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=dd54145f05300416bad69be3b6e3d113 \
    MYSQL_MD5=8e0536a26688cedffa0b47cbe748a7be \
    MARIADB_MD5=c4b1275894de15bdd74c8968d740541a \
    POSTGRES_MD5=d25dd1020992ea679f2938fb6d7a9dd6 \
    SQLSERVER_MD5=b79de78b1e29f4f8a8f6e7f9e130d880 \
    ORACLE_MD5=484e07bb0b64e70654d657b7943e40ba \
    DB2_MD5=456071d19dbcf2f1f5338a7c335eb957 \
    SPANNER_MD5=752bfadf5461385a841715e1ca8d37a1 \
    VITESS_MD5=0594967087a08de7ecac1797a3cb3655 \
    JDBC_MD5=cdbc11c96d2f180bf120d639786fd641 \
    INFORMIX_MD5=40f2145c6a41e07e665c58849ed393a6 \
    IBMI_MD5=200a04f069d334121d9457f970fde653 \
    COCKROACHDB_MD5=6fb01f676e349c6227425186c4cd221e \
    SCRIPTING_MD5=9290aa89473c48006ba157e93f054087 \
    CHRONICLE_QUEUE_MD5=d2fd66dc4efae0ae70e3f25790da5eb3

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

