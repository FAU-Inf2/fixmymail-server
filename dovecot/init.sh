#!/bin/sh

if [ -n "${FIXMYMAILPW}" ]; then
    echo -e "$FIXMYMAILPW\n$FIXMYMAILPW" | passwd fixmymail
fi

/etc/init.d/rsyslog start
/etc/init.d/ssh start
/usr/sbin/dovecot -F
