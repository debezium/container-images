FROM mysql:8.1

LABEL maintainer="Debezium Community"

COPY mysql.cnf /etc/mysql/conf.d/
COPY inventory.sql /docker-entrypoint-initdb.d/
