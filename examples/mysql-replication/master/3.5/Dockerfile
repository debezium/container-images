FROM container-registry.oracle.com/mysql/community-server:8.2

ENV MYSQL_ROOT_PASSWORD=debezium

COPY master.cnf /etc/my.cnf
COPY inventory.sql /docker-entrypoint-initdb.d/
