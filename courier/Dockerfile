
FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt-get update

RUN apt-get install -y openssh-server
RUN apt-get install -y vim
RUN apt-get install -y telnet

RUN apt-get install -y courier-imap courier-imap-ssl

RUN maildirmake /etc/skel/Maildir
RUN maildirmake /etc/skel/Maildir/.Drafts
RUN maildirmake /etc/skel/Maildir/.Sent
RUN maildirmake /etc/skel/Maildir/.Trash
RUN maildirmake /etc/skel/Maildir/.Templates

RUN useradd -m fixmymail

ADD config/vimrc /root/.vimrc
