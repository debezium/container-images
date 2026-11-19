FROM registry.fedoraproject.org/fedora-minimal:44

LABEL maintainer="Debezium Community"

USER root
RUN microdnf update -y &&\
    microdnf install -y java-25-openjdk tar gzip iproute findutils zip &&\
    microdnf clean all

# Mitigation for CVE-2026-114938 (heap overflow in the AVX-512 Base64 decode intrinsic).
# Remove once the java-25-openjdk package installed above includes the fix (25.0.5.1 or later).
ENV JDK_JAVA_OPTIONS="-XX:-UseBASE64Intrinsics"
