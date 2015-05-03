#/bin/sh

/etc/init.d/rsyslog start
/etc/init.d/ssh start
/etc/init.d/dovecot start

if [ -n "${FIXMYMAILPW}" ]; then
    echo -e "$FIXMYMAILPW\n$FIXMYMAILPW" | passwd fixmymail
fi
