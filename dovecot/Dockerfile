
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

ADD config/vimrc /root/.vimrc

EXPOSE 143 993 110 995
CMD ["/bin/sh", "/etc/init.d/rsyslog", "start"]
