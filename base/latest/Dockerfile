FROM registry.fedoraproject.org/fedora-minimal:41

LABEL maintainer="Debezium Community"

USER root
RUN microdnf update -y &&\
    microdnf install -y java-21-openjdk tar gzip iproute findutils zip &&\
    microdnf clean all
