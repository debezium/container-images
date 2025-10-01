ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.4

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.3.0.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=f973608f96c0be17189fb4dc8794eec7 \
    MYSQL_MD5=d239c6c23c7660b5cae26de06add54a2 \
    MARIADB_MD5=dbd8bd1ccd4724f7100c36955f6e40bc \
    POSTGRES_MD5=83475052aad6fc21c5b6b28a0f3073e5 \
    SQLSERVER_MD5=f4461df67f57568d493978a981ebe1f4 \
    ORACLE_MD5=da352b6d2940123bcb8fbdc4a229b7e5 \
    DB2_MD5=b8642b28b634a3d826bb32f656db42a6 \
    SPANNER_MD5=1e577c6bb9fb475e37ef5260c2916c5e \
    VITESS_MD5=c66c5064d2a82ab534d91967dd03cd83 \
    JDBC_MD5=28430b98d7db981e6b6645533e5b63ef \
    INFORMIX_MD5=e576fcc7f9464c88dcbe8b7fb0514c23 \
    IBMI_MD5=6892ce47aef73d1e455e8e4637928056 \
    COCKROACHDB_MD5=c1eda58e444310657ae381cb4c116aad \
    SCRIPTING_MD5=7c837a94b599e756b3793a559d7ed901

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

