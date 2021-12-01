FROM debezium/connect-base:1.6

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.6.4.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=16d71e14ae61b0af135d630e62e89185 \
    MYSQL_MD5=4e813897de3a941771eae012752267df \
    POSTGRES_MD5=037307617cf1eec5d366f7de72c38393 \
    SQLSERVER_MD5=377f6cea5c839e4828ec30229cb39944 \
    ORACLE_MD5=a6712f45ffed040769b0b981d7d9299e \
    DB2_MD5=073d3059a34228f3feea1ffbdd867ec2 \
    VITESS_MD5=d5ba24429a76bbd560d00eb5df18f4d9 \
    SCRIPTING_MD5=1af07bd466953e3a58665b81a9017865

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
