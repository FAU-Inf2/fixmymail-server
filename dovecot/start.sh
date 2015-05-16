#!/bin/sh

if [ -n "${FIXMYMAILPW}" ]; then
    echo "$FIXMYMAILPW:fixmymail" | chpasswd
fi

chown -R vmail:vmail /srv/vmail;
service rsyslog start;
service ssh start;
service postfix start;
service dovecot start;
/bin/bash;
