ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.4

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.4.1.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=9eca5be68943ceed317b9a75e5d31a3d \
    MYSQL_MD5=db5173f33106bf66f33a8b72343393f5 \
    POSTGRES_MD5=94a4be8a1eb7f58e140c704c2e979fb5 \
    SQLSERVER_MD5=8de2b4c5e2ed721db8dd4ce2af1d25b1 \
    ORACLE_MD5=ddca21aae4c5fb0182c66d513e1cdc07 \
    DB2_MD5=aeb0b0315861eb4645b2dc978eea5d13 \
    SPANNER_MD5=38275097c0b2c37e7fb74ef19cc91b12 \
    VITESS_MD5=7385d77dc63372be03d68d8ec2dd7a4a \
    JDBC_MD5=24ddb94502efc91ded743ba8f32eca57 \
    KCRESTEXT_MD5=5249e62b49f5f84c24b0a4747b14e344 \
    SCRIPTING_MD5=c9951753075ca2507cf530dcf94f109a

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional jdbc jdbc "$DEBEZIUM_VERSION" "$JDBC_MD5" && \
    docker-maven-download debezium-additional spanner spanner "$DEBEZIUM_VERSION" "$SPANNER_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional connect-rest-extension "$DEBEZIUM_VERSION" "$KCRESTEXT_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

