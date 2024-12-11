ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.7

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.7.4.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=ccc3f1c3d76632c78ce0c52e8a38d305 \
    MYSQL_MD5=afc29042665e5088ebcd21fbbfc41835 \
    MARIADB_MD5=e56ae14bab37e8c5468fd890f95d2b48 \
    POSTGRES_MD5=0dce7962ecae166afca16ec5fcd508f9 \
    SQLSERVER_MD5=de3263ca011865d99d8da12a2f51cea4 \
    ORACLE_MD5=eb2d90d77fc00808c6f49b47072db8f4 \
    DB2_MD5=080fdafc364bfb2c58c725aef926a97b \
    SPANNER_MD5=6108726cc5a5275a70b70b218fcec78e \
    VITESS_MD5=defd2449d80e70e3a84e8a81ec8c4a05 \
    JDBC_MD5=310d3d2af605bf386d4c78c195044dfe \
    INFORMIX_MD5=b1acbc3834a8ab37d7ea0a856fd21c61 \
    IBMI_MD5=63c16e299aa45747b98d1dab7bbde2b5 \
    KCRESTEXT_MD5=f0786894155db0a43a48f04247a949e7 \
    SCRIPTING_MD5=75fdd97f8c81636bc09948f306bc5882

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium mariadb "$DEBEZIUM_VERSION" "$MARIADB_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional jdbc jdbc "$DEBEZIUM_VERSION" "$JDBC_MD5" && \
    docker-maven-download debezium-additional spanner spanner "$DEBEZIUM_VERSION" "$SPANNER_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-additional informix informix "$DEBEZIUM_VERSION" "$INFORMIX_MD5" && \
    docker-maven-download debezium-additional ibmi ibmi "$DEBEZIUM_VERSION" "$IBMI_MD5" && \
    docker-maven-download debezium-optional connect-rest-extension "$DEBEZIUM_VERSION" "$KCRESTEXT_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

