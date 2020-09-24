FROM debezium/connect-base:1.2

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.2.5.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPO_INCUBATOR="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=e592445775b666cc1cedf7040ece6f12 \
    MYSQL_MD5=015fbe0f43f1ad25b7d75660109ac8b2 \
    POSTGRES_MD5=a1c55abd8abd0de2d22cd9e9e1310727 \
    SQLSERVER_MD5=f9ff4bce0784696eb2b10a88d79158a7 \
    ORACLE_MD5=457b834714f2b43f4d1809248ff7961a \
    DB2_MD5=49b4227658459cf2ae716394d42d521a \
    SCRIPTING_MD5=88130376a73c02817556d32a43736621

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-incubator db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
