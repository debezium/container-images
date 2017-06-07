FROM postgres:9.5

MAINTAINER Debezium Community

COPY postgresql.conf.sample /usr/share/postgresql/postgresql.conf.sample
COPY wal2json.so /usr/lib/postgresql/$PG_MAJOR/lib/wal2json.so
COPY LICENSE /usr/lib/postgresql/$PG_MAJOR/lib/wal2json.license