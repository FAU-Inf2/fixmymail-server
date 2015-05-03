#!/bin/sh

/etc/init.d/rsyslog start
/etc/init.d/ssh start
/etc/init.d/saslauthd start
/etc/init.d/cyrus-imapd start

if [ -n "${CYRUSPW}" ]; then
    echo -e "$CYRUSPW\n$CYRUSPW" | passwd cyrus
    echo -e "$CYRUSPW\n$CYRUSPW" | saslpasswd2 -c cyrus
fi

if [ -n "${FIXMYMAILPW}" ]; then
    echo -e "$FIXMYMAILPW\n$FIXMYMAILPW" | passwd fixmymail
fi

#NAME=cyrmaster
#DAEMON=/usr/sbin/${NAME}
#PIDFILE="/var/run/${NAME}.pid"

#start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON &

#wait 
/etc/init.d/cyrus-imapd start
