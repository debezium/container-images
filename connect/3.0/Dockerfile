ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.0

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.0.0.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=aed26cfa002935e3c9e22969fd379f77 \
    MYSQL_MD5=db4cde38ea4775905bd562298624c8ec \
    MARIADB_MD5=1f0c0cf11849c5240d53a7b9989fc992 \
    POSTGRES_MD5=43178265eb364d7d2db0cd619d1be723 \
    SQLSERVER_MD5=61718819c38f442b0c7b0efc4e83b457 \
    ORACLE_MD5=12dc63aee60097c1776861d8d1e40201 \
    DB2_MD5=4ec568835f6977b61f1fb7f5f2da0698 \
    SPANNER_MD5=d82b6e9b953c3520dacba9568bce39f9 \
    VITESS_MD5=146454de96a56c4123c3f116426539d4 \
    JDBC_MD5=f23a1341a03af316eb1118ff032d632d \
    INFORMIX_MD5=195a9482f522ec16a5425061c1f6c47b \
    IBMI_MD5=cb6729bce45413daf7faff47fcd80a46 \
    KCRESTEXT_MD5=34ba8010801f5eaa1a5206df8faf578b \
    SCRIPTING_MD5=c88b7966ab89197fe04783dd5296e161

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

