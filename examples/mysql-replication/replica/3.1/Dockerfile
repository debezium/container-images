FROM container-registry.oracle.com/mysql/community-server:8.2

ENV MYSQL_ROOT_PASSWORD=debezium

COPY slave.cnf /etc/my.cnf
COPY init.sql /docker-entrypoint-initdb.d/

