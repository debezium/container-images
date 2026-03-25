ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.5

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.5.0.CR1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=49778170e5de8c45d262ac9ce5d58705 \
    MYSQL_MD5=2c4c1f4d37dd929ce0bcec1aed910e03 \
    MARIADB_MD5=69cc0221ef345cd624e7482017ac5c80 \
    POSTGRES_MD5=b105dd61cf45f54f86a7c8fd6a91a49b \
    SQLSERVER_MD5=8e89d859091f1fd7432fabc3e089066e \
    ORACLE_MD5=f28566351a5ce8baa4186a76dea398e0 \
    DB2_MD5=3ffc9e467c207f3cdc22b0c2e2d7ee12 \
    SPANNER_MD5=509921126d0c7709cda14943d627f583 \
    VITESS_MD5=287523ec361eae006d0851b09a8f2b30 \
    JDBC_MD5=8a3be7ee40e1e0b78ace45451944cdaf \
    INFORMIX_MD5=c8049b06db12a594826623a6490ccefb \
    IBMI_MD5=76d72ffb2b1a1688a747dd5670c2c276 \
    COCKROACHDB_MD5=a9df6673fa383f74bfad7ef5370b41c9 \
    SCRIPTING_MD5=3678f39170731bb28ead493959d334a6

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

