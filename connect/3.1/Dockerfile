ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.1

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.1.0.Alpha2" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=0d558974b57686b6b6821110cd57df43 \
    MYSQL_MD5=ad6a9f15973e23df8e2612d4063c79a8 \
    MARIADB_MD5=707058d675788b5b2f014064288921c8 \
    POSTGRES_MD5=bb9cb8bcd345eb9c54ed5aa6b008b9a4 \
    SQLSERVER_MD5=a47f5127874805de1f9eab037f97c352 \
    ORACLE_MD5=25ddc884f4acd6473cd72d51ba61d523 \
    DB2_MD5=710d183161397814177cc04491e18771 \
    SPANNER_MD5=ae18bc45778dda9f99ff2bdda9fd8333 \
    VITESS_MD5=a3adad1f6590110a6b3dea1d6b59af1d \
    JDBC_MD5=64e94a17403a0dd6e8d3796f6f2fbfce \
    INFORMIX_MD5=746323f31db9991c4183cd4e35956e06 \
    IBMI_MD5=1d0495bff573ec9e64291f86fac8d01f \
    KCRESTEXT_MD5=f0391f1efac18834768059a692caaf88 \
    SCRIPTING_MD5=6516fc1feb86c5359031bfb05060bc36

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

