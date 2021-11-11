FROM debezium/connect-base:1.8

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.8.0.Alpha2" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=c9006fc2573fb4565429e2f340339559 \
    MYSQL_MD5=c63db4ddf3734275b5f42ed8d6fb7c91 \
    POSTGRES_MD5=659e0cccd364ba8429a7e78bdf109a0b \
    SQLSERVER_MD5=b2e78e418af9e520b156aa0fcfb5aff0 \
    ORACLE_MD5=ebe7e18ae32413d4bb5bf5bcb8162ab7 \
    DB2_MD5=001ecdb56c3dbc5202b0944349b6e465 \
    VITESS_MD5=44643883c5f2d9db2004abc5a388399c \
    SCRIPTING_MD5=1c59d36a1a7e68c5421e471276bee124

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
