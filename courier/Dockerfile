FROM mail-base

# Install postfix as MTA
RUN apt-get install -y --force-yes postfix

# postfix configuration
RUN echo "mail.docker.container" > /etc/mailname
ADD ./postfix.main.cf /etc/postfix/main.cf
ADD ./postfix.master.cf.append /etc/postfix/master-additional.cf
RUN cat /etc/postfix/master-additional.cf >> /etc/postfix/master.cf

# configure mail delivery to dovecot
#ADD ./aliases /etc/postfix/virtual
#ADD ./domains /etc/postfix/virtual-mailbox-domains
RUN cp /aliases /etc/postfix/virtual
RUN cp /domains /etc/postfix/virtual-mailbox-domains

# todo: this could probably be done in one line
RUN mkdir /etc/postfix/tmp; awk < /etc/postfix/virtual '{ print $2 }' > /etc/postfix/tmp/virtual-receivers
RUN sed -r 's,(.+)@(.+),\2/\1/,' /etc/postfix/tmp/virtual-receivers > /etc/postfix/tmp/virtual-receiver-folders
RUN paste /etc/postfix/tmp/virtual-receivers /etc/postfix/tmp/virtual-receiver-folders > /etc/postfix/virtual-mailbox-maps

# map virtual aliases and user/filesystem mappings
RUN postmap /etc/postfix/virtual
RUN postmap /etc/postfix/virtual-mailbox-maps

RUN apt-get install -y gamin courier-imap courier-imap-ssl

RUN maildirmake /etc/skel/Maildir
RUN maildirmake /etc/skel/Maildir/.Drafts
RUN maildirmake /etc/skel/Maildir/.Sent
RUN maildirmake /etc/skel/Maildir/.Trash
RUN maildirmake /etc/skel/Maildir/.Templates

RUN useradd -m fixmymail

ADD start.sh /start.sh
RUN chmod 755 /start.sh

# smtp port for incoming mail
EXPOSE 25 

# imap port
EXPOSE 143

# smtp port for outgoing
EXPOSE 587

EXPOSE 993 110 995

ENTRYPOINT ["/start.sh"]
