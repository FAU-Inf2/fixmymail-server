Collection of Dockerfiles and Co for fixmymail

Currently the following commands must be run in order to start Cyrus-Imap:
- /etc/init.d/cyrus-imapd start
- /etc/init.d/saslauthd start
- saslpasswd2 -c cyrus
- passwd cyrus

Anschließend noch Mailbox anlegen:
- cyradm --user cyrus localhost
- cm user.cyrus
