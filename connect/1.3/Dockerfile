FROM debezium/connect-base:1.3

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.3.0.Alpha1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPO_INCUBATOR="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=bfd8ec907981a8595e5f3545a1eda187 \
    MYSQL_MD5=59c9ca151e79b997a0299ac7700ec3c4 \
    POSTGRES_MD5=f0be93a71e202049087bb60551c6a5df \
    SQLSERVER_MD5=8a5a7ae0b733ddea02a4f1c929c65cf9 \
    ORACLE_MD5=169b69d7fea7b5ee5d7db2eb78ae33e2 \
    DB2_MD5=0299237a44dbb1f8b7366f3abfd301e5

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-incubator db2 "$DEBEZIUM_VERSION" "$DB2_MD5"
