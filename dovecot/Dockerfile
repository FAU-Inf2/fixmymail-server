
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

RUN apt-get install -y dovecot-core dovecot-imapd

RUN echo 'debconf debconf/frontend select Dialog' | debconf-set-selections

RUN useradd fixmymail
ADD config/vimrc /root/.vimrc
ADD init.sh /init.sh
RUN chmod 755 /init.sh

ADD config/10-centrallog.conf /etc/rsyslog.d/10-centrallog.conf

EXPOSE 143 993 110 995

ENTRYPOINT ["/init.sh"]
