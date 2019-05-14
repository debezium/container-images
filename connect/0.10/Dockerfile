FROM debezium/connect-base:0.10

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION=0.10.0.Alpha1 \
    MAVEN_REPO_CORE="https://repo1.maven.org/maven2" \
    MAVEN_REPO_INCUBATOR="https://repo1.maven.org/maven2" \
    MONGODB_MD5=b78344acb75eed0eb72a692a4dc74ce2 \
    MYSQL_MD5=df80868977f95d840e2a320b9ee973d9 \
    POSTGRES_MD5=604a967093188e18958fb95265c4fea4 \
    SQLSERVER_MD5=e12153c4032b555f130836a560f34402 \
    ORACLE_MD5=787eb46f91b412f119d5cc7d8729d319

COPY docker-debezium-download.sh /usr/local/bin/docker-debezium-download

RUN docker-debezium-download mongodb "$MONGODB_MD5" && \
    docker-debezium-download mysql "$MYSQL_MD5" && \
    docker-debezium-download postgres "$POSTGRES_MD5" && \
    docker-debezium-download sqlserver "$SQLSERVER_MD5" && \
    docker-debezium-download oracle "$ORACLE_MD5"
