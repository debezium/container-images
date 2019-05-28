FROM fedora:30 AS kafkacat
RUN dnf -y install gcc which gcc-c++ wget make git cmake
RUN git clone https://github.com/edenhill/kafkacat -b 1.4.0 --single-branch && \
    cd kafkacat && \
    ./bootstrap.sh

FROM fedora:30
RUN dnf -y install jq httpie mycli python-pip gcc redhat-rpm-config python-devel &&\
    pip install pgcli &&\
    dnf clean all
COPY --from=kafkacat /kafkacat/kafkacat /usr/bin/kafkacat

RUN mkdir licenses

COPY LICENSE* /licenses/
