# Debezium Tooling

This is a Fedora-based container image used for Debezium examples and demonstrations.
The image contains useful tools to work with Debezium, Apache Kafka and Kafka Connect.
The following tools are contained:

* kafkacat (https://github.com/edenhill/kafkacat)
* jq (https://github.com/stedolan/jq)
* httpie (https://github.com/jakubroztocil/httpie)
* mycli (https://github.com/dbcli/mycli)
* pgcli (https://github.com/dbcli/pgcli)
* kcctl (https://github.com/kcctl/kcctl)

The image could be used as a standalone container, part of Docker Compose deployment or can run inside an OpenShift deployment.

## License

The tools contained in this images are distributed under their original licenses.
See _LICENSE\_\<tool-name\>.txt_ in this directory for the specific license text applying to each of the tools.
