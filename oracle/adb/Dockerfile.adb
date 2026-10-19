# Oracle Autonomous Database Free Container Image
# This image is based on Oracle's ADB-Free container from Oracle Container Registry
# ADB Free requires 4 CPUs and 8GB memory
FROM container-registry.oracle.com/database/adb-free:25.9.3.2-23ai

LABEL maintainer="Debezium Community"

# ADB-specific environment variables
# WORKLOAD_TYPE: ATP (Transaction Processing) or ADW (Data Warehouse)
# DATABASE_NAME: Alphanumeric only, defaults to MYATP or MYADW
# ADMIN_PASSWORD: 12-30 chars, must include uppercase, lowercase, and numeric
# WALLET_PASSWORD: Min 8 chars with alphabetic + numbers/special chars
# ENABLE_ARCHIVE_LOG: Enable archive logging (True/False); required by the connector,
#                     which can only operate in archive-log-only mode on ADB
# GGADMIN_PASSWORD: Password for the GGADMIN account, the only user permitted to use
#                   LogMiner on an Autonomous Database (the user name is fixed by Oracle)
# DEBEZIUM_PASSWORD: Password for the DEBEZIUM test schema user; must satisfy the
#                    CDB-wide mandatory password complexity profile, which cannot be
#                    relaxed from within the ADB service. Pass it to the test suite
#                    with -Dschema.password.
ENV WORKLOAD_TYPE=ATP \
    DATABASE_NAME=MYATP \
    ADMIN_PASSWORD=Welcome_1234 \
    WALLET_PASSWORD=Welcome_1234 \
    ENABLE_ARCHIVE_LOG=True \
    GGADMIN_PASSWORD=Welcome_1234 \
    DEBEZIUM_PASSWORD=Dbz_Adb_Tests_2026

# The adb-free entrypoint has no setup/startup script hooks like the standard Oracle
# database images, so a wrapper entrypoint runs the Debezium provisioning alongside it
# once the database service becomes available.
# Note: the build context is the oracle/ directory, so paths are relative to it.
COPY --chown=oracle:oinstall adb/scripts/debezium-entrypoint.sh adb/scripts/debezium-adb-setup.sh /opt/debezium/

USER oracle

ENTRYPOINT ["/bin/bash", "/opt/debezium/debezium-entrypoint.sh"]