FROM debezium/connect-base:1.2

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.2.0.Beta2" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPO_INCUBATOR="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=6594061af0d07deee5fa9a8baf314bb0 \
    MYSQL_MD5=c171e1e0ade1df4eba345cf9d5409647 \
    POSTGRES_MD5=886f0a77e6146198056360ab2f173fe1 \
    SQLSERVER_MD5=ae151b033d92727954332c95dbeb18a8 \
    ORACLE_MD5=915d7ef83f932f49ad41b91ac36ca9ed \
    DB2_MD5=90b88d77bf9c82991bf4835da7532384

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-incubator db2 "$DEBEZIUM_VERSION" "$DB2_MD5"
