# Base image
# FROM ibmcom/informix-developer-database:12.10.FC12W1DE
FROM quay.io/debezium/ibmcom-informix-developer-database:12.10.FC12W1DE

# Environment variables 
ENV SIZE=small \
    TYPE=oltp \
    USEOSTIME=1 \
    DB_SBSPACE=1 \
    DBDATE="MDY2." \
    DBCENTURY=C \
    DBMONEY="$." \
    RUN_FILE_POST_INIT=informix_init.sh

# Modify onconfig.std as in runCmds
RUN sed -Ei 's/^(USEOSTIME)\s+\S/\1 1/' /opt/ibm/informix/etc/onconfig.std

# Copy initialization script
COPY --chmod=755 --chown=informix:informix ./files/informix_init.sh /opt/ibm/scripts/
COPY --chmod=755 --chown=informix:informix ./files/testdb.sql /opt/ibm/informix/etc/
