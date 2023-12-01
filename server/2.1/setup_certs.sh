#!/bin/bash

# IMPORTANT: This script is copied from: https://docs.aws.amazon.com/documentdb/latest/developerguide/connect_programmatically.html#w139aac29c11c13b5b9 
# and modified to inject the certificates into Java's default cacert
mydir=/tmp/certs
truststore=$JAVA_HOME/lib/security/cacerts
storepassword=changeit

curl -sS "https://truststore.pki.rds.amazonaws.com/global/global-bundle.pem" > ${mydir}/global-bundle.pem
awk 'split_after == 1 {n++;split_after=0} /-----END CERTIFICATE-----/ {split_after=1}{print > "rds-ca-" n ".pem"}' < ${mydir}/global-bundle.pem

for CERT in rds-ca-*; do
  alias=$(openssl x509 -noout -text -in $CERT | perl -ne 'next unless /Subject:/; s/.*(CN=|CN = )//; print')
  echo "Importing $alias"
  keytool -trustcacerts -import -file ${CERT} -alias "${alias}" -storepass ${storepassword} -keystore ${truststore} -noprompt
  rm $CERT
done
