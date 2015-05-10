#!/bin/sh

if [ -n "${FIXMYMAILPW}" ]; then
    echo -e "$FIXMYMAILPW\n$FIXMYMAILPW" | passwd fixmymail;
fi

/usr/sbin/rsyslogd -n &
/usr/sbin/sshd -D &
/etc/init.d/courier-authdaemon start
/etc/init.d/courier-imap start

wait
