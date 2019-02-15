FROM fedora:28
RUN dnf -y install gcc which gcc-c++ wget make git
RUN git clone https://github.com/edenhill/kafkacat -b 1.4.0-RC1 --single-branch && \
    cd kafkacat && \
    ./bootstrap.sh

FROM fedora:28
RUN dnf -y install jq httpie mycli python-pip gcc redhat-rpm-config python-devel &&\
    pip install pgcli &&\
    dnf clean all
COPY --from=0 /kafkacat/kafkacat /usr/bin/kafkacat

RUN mkdir licenses

COPY LICENSE* /licenses/
