#!/bin/sh

if [ -n "${FIXMYMAILPW}" ]; then
    echo "$FIXMYMAILPW:fixmymail" | chpasswd
fi

chown -R vmail:vmail /srv/vmail;
service rsyslog start;
service ssh start;
service postfix start;
service courier-authdaemon start;
service courier-imap-ssl start;
#service courier-imap start;
/usr/sbin/courierlogger -name=imapd /usr/sbin/couriertcpd -address=0 -maxprocs=40 -maxperip=20 -nodnslookup -noidentlookup 143 /usr/lib/courier/courier/imaplogin /usr/bin/imapd Maildir
/bin/bash;
