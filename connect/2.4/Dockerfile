ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.4

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.4.0.Beta2" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=76617ff3054fd8a2e741a1b894462dae \
    MYSQL_MD5=b13003a720925d2a7fc6a33120fcb611 \
    POSTGRES_MD5=6030468b2b72538131bb5552ab878641 \
    SQLSERVER_MD5=17e41beba49274fb9bf747cf5dfddf1b \
    ORACLE_MD5=7275d03402d9a92b8a4581e014117804 \
    DB2_MD5=647ccab87332aa404ebddcc882d01d0f \
    SPANNER_MD5=67fed8b5330748b034aef649a255a6eb \
    VITESS_MD5=45df4ebddb51f31828f8bad7bb10b32a \
    JDBC_MD5=7fd588224b24ac89fd0fb9008e32909a \
    KCRESTEXT_MD5=0f9cd750dd74276607d4864a921abc13 \
    SCRIPTING_MD5=8979657293148c718ccb7f24560831c9

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional jdbc jdbc "$DEBEZIUM_VERSION" "$JDBC_MD5" && \
    docker-maven-download debezium-additional spanner spanner "$DEBEZIUM_VERSION" "$SPANNER_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional connect-rest-extension "$DEBEZIUM_VERSION" "$KCRESTEXT_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

