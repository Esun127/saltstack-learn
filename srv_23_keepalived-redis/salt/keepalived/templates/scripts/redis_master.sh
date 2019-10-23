#!/bin/bash


REDISCLI="/usr/bin/redis-cli"
LOGFILE="/var/log/keepalived-redis-state.log"
echo "[master]" >> $LOGFILE
date >> $LOGFILE
echo "Being master ..." >> $LOGFILE 2 > &1
echo "Run SLAVEOF NO ONE command ..." >> $LOGFILE
$REDISCLI SLAVEOF {{ grains['master_ip'] }} 6379 >> $LOGFILE 2 > &1
$REDISCLI SLAVEOF NO ONE >> $LOGFILE 2 > &1
