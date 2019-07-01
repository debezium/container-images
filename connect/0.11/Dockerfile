FROM debezium/connect-base:0.10

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="0.10.0.Beta2" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPO_INCUBATOR="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=5bf4a6409b28acc19cd49cc142c0555b \
    MYSQL_MD5=6a2ceaffe30c693f7088305e86d1ea8f \
    POSTGRES_MD5=3915ca9b2147e6f1a2d5ad69bef747bf \
    SQLSERVER_MD5=a09d747a9528ffd679a51cc784e8187b \
    ORACLE_MD5=38105c736a2d209b8e062121ba5e7eb5

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5"
