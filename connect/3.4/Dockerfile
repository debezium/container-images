ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.4

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.4.0.Beta1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=7daff89791b219c965d75f4f4ca36341 \
    MYSQL_MD5=7c536fd2bd642d526c9ac68888daf8ff \
    MARIADB_MD5=1a8ab1995ec79d211ad3e72703fb2485 \
    POSTGRES_MD5=d9ed199345b408b868b1590ee8323a34 \
    SQLSERVER_MD5=ae71f525375003cc002976f8a63df8ec \
    ORACLE_MD5=5fa67d1f350eb56d03615f80576571e9 \
    DB2_MD5=8619de0220da3bf1b8f9cdf9b7f28d82 \
    SPANNER_MD5=0fea70d41d017e0e9356a87e6180fcc8 \
    VITESS_MD5=c185c46a4bdbf439b40f300a1e1beea0 \
    JDBC_MD5=215c788f0083ae15c4e405bdd3a15dde \
    INFORMIX_MD5=a4286cb91a3e434f6d264832bba9e165 \
    IBMI_MD5=ae91a479d57b11a98a366335d132d4fa \
    COCKROACHDB_MD5=287dfe0fba89cbb40825f17d78951c41 \
    SCRIPTING_MD5=4c1b176ab2971b99dc90db59dbe133c0

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

