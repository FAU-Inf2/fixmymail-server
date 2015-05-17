#!/bin/sh

if [ -n "${CYRUSPW}" ]; then
    echo "$CYRUSPW:cyrus" | chpasswd
    echo -e "$CYRUSPW\n$CYRUSPW" | saslpasswd2 -c cyrus
fi

if [ -n "${FIXMYMAILPW}" ]; then
    echo "$FIXMYMAILPW:fixmymail" | chpasswd
fi

chown -R vmail:vmail /srv/vmail;
service rsyslog start;
service ssh start;
service saslauthd start;
service postfix start;
/usr/sbin/cyrmaster;
/bin/bash;
