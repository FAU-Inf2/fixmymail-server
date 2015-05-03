
FROM debian

ENV DEBIAN_FRONTEND noninteractive
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt-get update

RUN apt-get install -y rsyslog
RUN apt-get install -y openssh-server
RUN apt-get install -y vim
RUN apt-get install -y telnet
RUN apt-get install -y less
RUN apt-get install -y mysql-client

RUN echo "cyrus-common cyrus-common/removespools boolean true" | debconf-set-selections

RUN apt-get install -y cyrus-imapd cyrus-admin sasl2-bin

RUN echo 'debconf debconf/frontend select Dialog' | debconf-set-selections

RUN chown cyrus /etc/sasldb2
RUN useradd fixmymail

ADD config/imapd.conf /etc/imapd.conf
ADD config/cyrus.conf /etc/cyrus.conf
ADD config/saslauthd /etc/default/saslauthd

#TODO BaseImage?
ADD config/vimrc /root/.vimrc

ADD init.sh /init.sh
RUN chmod 744 /init.sh

EXPOSE 143 993 110 995

CMD ["/init.sh"]
