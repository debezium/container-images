FROM fedora:30 AS kafkacat
RUN dnf -y install gcc which gcc-c++ wget make git cmake
ENV KAFKACAT_VERSION=1.5.0
RUN dnf -y install cyrus-sasl-devel libcurl-devel libzstd-devel
RUN git clone https://github.com/edenhill/kafkacat -b $KAFKACAT_VERSION --single-branch && \
    cd kafkacat && \
    ./bootstrap.sh

FROM fedora:30
RUN dnf -y install jq httpie mycli python3-pip gcc redhat-rpm-config python-devel libpq-devel &&\
    pip install pgcli &&\
    dnf clean all
COPY --from=kafkacat /kafkacat/kafkacat /usr/bin/kafkacat

RUN mkdir licenses

COPY LICENSE* /licenses/
