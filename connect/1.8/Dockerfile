FROM debezium/connect-base:1.8

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.8.0.Beta1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=bdc6336651700328590fe8038b3c17bf \
    MYSQL_MD5=8794455710331bf7849c704a4a7c7609 \
    POSTGRES_MD5=ab9d10145bfc03a6c9eaa287dcc97acd \
    SQLSERVER_MD5=018b0ac94f44ae4ea31b5614105aca53 \
    ORACLE_MD5=6a2695d9d2100e0340b4764d64e674b3 \
    DB2_MD5=8a2581b65484f2f90e09534099b4b774 \
    VITESS_MD5=1dc30b11257250ec8332cbc98f74066f \
    SCRIPTING_MD5=331e2a60681a78fd9046139d959828f4

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
