#!/bin/sh

if [ -n "${FIXMYMAILPW}" ]; then
    echo -e "$FIXMYMAILPW\n$FIXMYMAILPW" | passwd fixmymail
fi

#/usr/sbin/rsyslogd -n &
#/usr/sbin/sshd -D &
#/usr/sbin/dovecot
#/etc/init.d/rsyslog start
#/etc/init.d/ssh start
#/etc/init.d/dovecot start
svscanboot
#wait
