FROM registry.fedoraproject.org/fedora-minimal:31

RUN microdnf -y update && microdnf -y install skopeo jq && microdnf clean all

COPY sync.sh sync.sh
RUN chmod 755 sync.sh

CMD ./sync.sh
