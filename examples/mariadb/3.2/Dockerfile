FROM mirror.gcr.io/library/mariadb:11.4.3

LABEL maintainer="Debezium Community"

COPY mysql.cnf /etc/mysql/conf.d/
COPY inventory.sql /docker-entrypoint-initdb.d/
