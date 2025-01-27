FROM container-registry.oracle.com/mysql/community-server:8.2

ENV MYSQL_ROOT_PASSWORD=debezium

COPY slave.cnf /etc/mysql/conf.d/
COPY init.sql /docker-entrypoint-initdb.d/

