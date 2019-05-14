FROM debezium/connect-base:0.10

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION=0.9.0.Final \
    MAVEN_REPO_CORE="https://repo1.maven.org/maven2" \
    MAVEN_REPO_INCUBATOR="https://repo1.maven.org/maven2" \
    MONGODB_MD5=c6e21b95145e778602bb771b6552e997 \
    MYSQL_MD5=936de29a4468d3e24f3c0224e9ebf798 \
    POSTGRES_MD5=f4366565ef7b3331e3e7a401d267b1c5 \
    SQLSERVER_MD5=2d5ed4cc0e6bb73f9f0cc305df339947 \
    ORACLE_MD5=aa0af74cbe7ea95d47753372baac388c

COPY docker-debezium-download.sh /usr/local/bin/docker-debezium-download

RUN docker-debezium-download mongodb "$MONGODB_MD5" && \
    docker-debezium-download mysql "$MYSQL_MD5" && \
    docker-debezium-download postgres "$POSTGRES_MD5" && \
    docker-debezium-download sqlserver "$SQLSERVER_MD5" && \
    docker-debezium-download oracle "$ORACLE_MD5"
