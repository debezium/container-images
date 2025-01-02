ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/debeziumquay/connect-base:3.1

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.0.6.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=f94b51d17d646db4ce247a57366ccf2f \
    MYSQL_MD5=ff6491af002457f1282e0c82e0155f96 \
    MARIADB_MD5=5d6f11a69e8d2eb70e8a62bd811ce6e5 \
    POSTGRES_MD5=5e77196ad833fff23bb2be9e47d3115c \
    SQLSERVER_MD5=1c003af0f8d4c667e32e5260aa534e91 \
    ORACLE_MD5=f2a885133ce94e69cf7a5adb7b2a2373 \
    DB2_MD5=c4d6f92b822ed9350292f4b06b70d235 \
    SPANNER_MD5=111f7dea39fd2a076ddb4139bb4d3fae \
    VITESS_MD5=78b83090b2a889a486bc553082cde5a0 \
    JDBC_MD5=58a6b7518a6988296ded61493af9345c \
    INFORMIX_MD5=2a0cb305288c7c44458c5de2f04a732a \
    IBMI_MD5=cffbd2e3737d79e543a3f57c2b3491b5 \
    KCRESTEXT_MD5=e9a994ab0cbb7eccebf1e574e710a382 \
    SCRIPTING_MD5=687f621989ec0ffc98666ede71e265e6

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

