ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.6

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.6.0.Alpha2" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=ad4342094f6e4f3202d4e915462900c0 \
    MYSQL_MD5=8593cc4c0770e086432647ecbbe7ccc2 \
    POSTGRES_MD5=218ce3145f4e919df9bcd9c3cbd5c4da \
    SQLSERVER_MD5=d35964bb87f27a95b8bce588107e18f2 \
    ORACLE_MD5=f78d572f32deef62a4614be88fe8dec8 \
    DB2_MD5=24ec34234331f51887dc39cbaf3d7119 \
    SPANNER_MD5=7f658f36b3510d46c519cc5af21b80ff \
    VITESS_MD5=4cd7a3b80da5b4c700ad99a65eab7138 \
    JDBC_MD5=754816646f28bdcf1cdb74f3b9e4d546 \
    INFORMIX_MD5=65ab8af12854ab043d40eb251c7395be \
    KCRESTEXT_MD5=e2b29c281f2a1fe81eafe1bdbe7492f3 \
    SCRIPTING_MD5=eb82a335dd7aa837c8b246d3492d0019

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

