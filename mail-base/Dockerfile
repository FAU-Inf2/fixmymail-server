FROM debian

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

RUN apt-get -y -q autoclean
RUN apt-get -y -q autoremove
RUN apt-get clean

RUN apt-get install -y rsyslog
RUN apt-get install -y openssh-server
RUN apt-get install -y vim
RUN apt-get install -y telnet
RUN apt-get install -y less
RUN apt-get install -y man

# add user vmail who own all mail folders
RUN groupadd -g 5000 vmail
RUN useradd -g vmail -u 5000 vmail -d /srv/vmail -m
RUN chown -R vmail:vmail /srv/vmail
RUN chmod u+w /srv/vmail

ADD ./domains /domains
ADD ./aliases /aliases
ADD ./passwords /passwords
ADD ./vimrc /root/.vimrc
ADD ./10-centrallog.conf /etc/rsyslog.d/10-centrallog.conf
