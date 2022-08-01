FROM registry.fedoraproject.org/fedora-minimal:34

LABEL maintainer="Debezium Community"

USER root
RUN microdnf update -y &&\
    microdnf install -y java-11-openjdk tar gzip iproute findutils zip &&\
    microdnf clean all
