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
# ENABLE_ARCHIVE_LOG: Enable archive logging (True/False)
ENV WORKLOAD_TYPE=ATP \
    DATABASE_NAME=MYATP \
    ADMIN_PASSWORD=Welcome_1234 \
    WALLET_PASSWORD=Welcome_1234 \
    ENABLE_ARCHIVE_LOG=True

COPY --chown=54321 scripts/setup/00-debezium-install.sh /opt/oracle/scripts/setup
COPY --chown=54321 scripts/startup/00-debezium-restart-capture-instances.sh /opt/oracle/scripts/startup

USER oracle
