FROM debezium/connect-base:1.6

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.6.3.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=0b64ad4a59ff888f435ab456a95b44bc \
    MYSQL_MD5=81f89a2814df93fcb9f9be38bd683360 \
    POSTGRES_MD5=b54464041420937696ef2783ce314100 \
    SQLSERVER_MD5=30f7afaebca19c66a84e9319e12e5fee \
    ORACLE_MD5=8c9758094cb69b1b49eb6f7a70987429 \
    DB2_MD5=b8726f5379fca2435fb9dcac9117e077 \
    VITESS_MD5=1bc7cdc7243283cec970ebbe760a25ed \
    SCRIPTING_MD5=7230047c91ea5e9ddf2d3d8336194936

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
