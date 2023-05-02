FROM mysql:latest

ENV MYSQL_ROOT_PASSWORD=debezium

COPY master.cnf /etc/my.cnf
COPY inventory.sql /docker-entrypoint-initdb.d/
