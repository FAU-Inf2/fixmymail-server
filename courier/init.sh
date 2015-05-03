#/bin/sh

/etc/init.d/rsyslog start
/etc/init.d/ssh start
/etc/init.d/courier-authdaemon start
/etc/init.d/courier-imap start

if [ -n "${FIXMYMAILPW}" ]; then
    echo -e "$FIXMYMAILPW\n$FIXMYMAILPW" | passwd fixmymail;
fi
