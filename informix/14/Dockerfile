# Base image
FROM icr.io/informix/informix-developer-database:14.10.FC9W1DE


# Environment variables 
ENV SIZE=small \
    TYPE=oltp \
    USEOSTIME=1 \
    DB_SBSPACE=1 \
    DBDATE="MDY4/" \
    DBCENTURY=R \
    DBMONEY="€,¢" \
    RUN_FILE_POST_INIT=informix_post_init.sh

# Ensure USEOSTIME is set correctly inside onconfig
RUN sed -Ei 's/^(USEOSTIME)\s+\S/\1 1/' /opt/ibm/informix/etc/onconfig.std

# Copy initialization script
COPY --chmod=755 --chown=informix:informix ./files/informix_post_init.sh /opt/ibm/config/informix_post_init.sh
COPY --chmod=755 --chown=informix:informix ./files/testdb.sql /opt/ibm/informix/etc/testdb.sql
