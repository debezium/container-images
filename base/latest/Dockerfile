FROM registry.fedoraproject.org/fedora-minimal:44

LABEL maintainer="Debezium Community"

USER root
RUN microdnf update -y &&\
    microdnf install -y java-25-openjdk tar gzip iproute findutils zip &&\
    microdnf clean all
