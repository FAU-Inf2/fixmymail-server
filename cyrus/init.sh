#!/bin/sh
#NAME=cyrmaster
#DAEMON=/usr/sbin/${NAME}
#PIDFILE="/var/run/${NAME}.pid"

#start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON &

#wait 
/etc/init.d/cyrus-imapd start
