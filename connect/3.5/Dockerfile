ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.5

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.5.0.Beta2" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=a2d9f84d9fb4e558bd0bc7282cf316e9 \
    MYSQL_MD5=895797a50e9e4bb9543593a6ae4af18c \
    MARIADB_MD5=07f8f68f227af9fa3419d2ab9ecc6e43 \
    POSTGRES_MD5=854158b43cb70d813a9f3c39cb0d7033 \
    SQLSERVER_MD5=36ac3a4e9c50b752f7cb5e2598bc1531 \
    ORACLE_MD5=72804cc3e3787bc2bb7e4c2a994599d3 \
    DB2_MD5=6d8074f4a172e401fb8a1eede5119e3b \
    SPANNER_MD5=dcb7a35a462f275ad36f8524b839f343 \
    VITESS_MD5=fb8f251732d65f70a412b1ee647ea7a2 \
    JDBC_MD5=3182556aee72bc2adb823653e551e5e9 \
    INFORMIX_MD5=b2103f437e21b9c0989e8999d716e010 \
    IBMI_MD5=60c35aa6177ec01a8cfa3699abb3ba30 \
    COCKROACHDB_MD5=70a2aa6145961b20375261d82500b65f \
    SCRIPTING_MD5=d867e6ae5fe2395a0a450d989d5e581b

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
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

