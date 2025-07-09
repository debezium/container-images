ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.3

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.2.0.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=5898d389d9ff8520897b4e95383cb3cd \
    MYSQL_MD5=c5773373262a4ee73c5a7222ce7e36ac \
    MARIADB_MD5=85f6601400743f0c50ca981063588863 \
    POSTGRES_MD5=8d37a9ed002225f741ffd65f5e1aa7c5 \
    SQLSERVER_MD5=45ba6592b5a5b2aebd1cac1a47870eb2 \
    ORACLE_MD5=b5017866b1539e5218f3aed51e129107 \
    DB2_MD5=4c9de853a4f8cb14eb88c957ae229371 \
    SPANNER_MD5=df32d4d04a27eab9001b71dd88eb6a55 \
    VITESS_MD5=af6508f565cfaa12c29f987dcf8fc4b8 \
    JDBC_MD5=1c6b201d69c1288e21f8a453d6751052 \
    INFORMIX_MD5=756dd8b96c60e67ed99a2ec139f98bd8 \
    IBMI_MD5=188fd3549f94d69f5a7f48f1a1679681 \
    SCRIPTING_MD5=b2df7c5557cfde7420e525f66710c755

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
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

