#!/bin/bash

dbaccess sysadmin $BASEDIR/sql/informix_extend_root.sql >>$INIT_LOG 2>&1

dbaccess sysadmin $BASEDIR/sql/informix_sbspace.sql >>$INIT_LOG 2>&1

dbaccess sysadmin $INFORMIXDIR/etc/syscdcv1.sql >>$INIT_LOG 2>&1

dbaccess sysadmin $INFORMIXDIR/etc/testdb.sql >>$INIT_LOG 2>&1
