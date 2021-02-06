FROM debezium/connect-base:1.5

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.5.0.Alpha1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=f07d9e87d21f2830397bf3ff23f36fba \
    MYSQL_MD5=47c10c1f8eccf747fab4fffe80a36bb1 \
    POSTGRES_MD5=39e15320967f0555b08473d875dd5691 \
    SQLSERVER_MD5=f2a8787addcfb4b369d8b3a2af65a199 \
    ORACLE_MD5=62942101a1cb3de589088e64920e7aed \
    DB2_MD5=ed92db55cb928a3379f13f59dc15a06b \
    VITESS_MD5=d673a743a9cb644f97fad5b2b021680a \
    SCRIPTING_MD5=386a4b999ee8c8e0bf1621650a37233b

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-additional incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
