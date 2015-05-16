#!/bin/sh

if [ -n "${FIXMYMAILPW}" ]; then
#    echo -e "$FIXMYMAILPW\n$FIXMYMAILPW" | passwd fixmymail;
    echo "$FIXMYMAILPW:fixmymail" | chpasswd
fi

chown -R vmail:vmail /srv/vmail;
service rsyslog start;
service ssh start;
service postfix start;
service courier-authdaemon start;
service courier-imap-ssl start;
service courier-imap start;
/bin/bash;
