FROM debezium/postgres:15@sha256:f8e15e19ea125b65ae9d966f4651e316823eb4c94b565544d6b600a47f169cd1

LABEL maintainer="Debezium Community"

COPY inventory.sql /docker-entrypoint-initdb.d/
