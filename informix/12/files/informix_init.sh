#!/bin/bash
#
#  name:        informix_init.sh:
#  description: Initialize informix - first time initialize disk space
#  Called by:   informix_entry.sh

###
### Check to see if informix already disk initialized
###

# Initialize shared memmory and data structure
# and kill server
oninit -ivwy >>$INIT_LOG

ONLINE_LOG="${INFORMIX_DATA_DIR}/logs/online.log"
iter=0
while [ ${iter} -lt 120 ]; do
  grep -i "sysadmin" ${ONLINE_LOG} 2>&1 1>/dev/null
  if [ $? -eq 0 ]; then break; fi
  iter=$((iter + 1))
  sleep 1
done
if [ ${iter} -gt 120 ]; then
  printf "\n\tProblem creating sysadmin with oninit\n"
  exit
fi

dbaccess sysadmin $BASEDIR/sql/informix_extend_root.sql >>$INIT_LOG 2>&1

dbaccess sysadmin $BASEDIR/sql/informix_sbspace.sql >>$INIT_LOG 2>&1

dbaccess sysadmin $INFORMIXDIR/etc/syscdcv1.sql >>$INIT_LOG 2>&1

dbaccess sysadmin $INFORMIXDIR/etc/testdb.sql >>$INIT_LOG 2>&1
