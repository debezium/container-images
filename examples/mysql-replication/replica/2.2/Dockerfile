FROM mysql:latest

ENV MYSQL_ROOT_PASSWORD=debezium

COPY slave.cnf /etc/my.cnf
COPY init.sql /docker-entrypoint-initdb.d/

