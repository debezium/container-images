FROM centos/mysql-57-centos7

MAINTAINER Debezium Community

ENV MYSQL_DATABASE=inventory

COPY inventory.sql init.sh $APP_DATA/mysql-init/
COPY mysql.cnf /etc/my.cnf.d/debezium.cnf
