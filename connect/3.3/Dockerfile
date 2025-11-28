ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.3

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.3.2.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=5043f84aebe097660414aa3ae39797bd \
    MYSQL_MD5=aba4023d56f06a51b40ac92c4694b8ca \
    MARIADB_MD5=a0bbd08997778d98bc7bf089ea254f89 \
    POSTGRES_MD5=550bb7f495176a775d728c345a0bf7fd \
    SQLSERVER_MD5=f97d3f0642b081ce072d190bf5346a14 \
    ORACLE_MD5=c072f5fa41e17afcc32d42238be7310b \
    DB2_MD5=b599ee466140ae5cafee6b3f3b23ae20 \
    SPANNER_MD5=f1794e88f804d6b4484f5045f7950dad \
    VITESS_MD5=6bd4f6d8d920229c28071bdd36b8b44c \
    JDBC_MD5=b808161350f00e8e2c12fce8dd36104e \
    INFORMIX_MD5=78f6cad06aa656b58d8d09d5d3e01a0a \
    IBMI_MD5=821aa3e488ce37bacbe0b84c516b3fd7 \
    COCKROACHDB_MD5=552775108a9076994a1cc5cd14c35911 \
    SCRIPTING_MD5=0185eaf5ef688345546f3cdfecc4f061

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

