all: mail-base dovecot cyrus courier rainloop

.PHONY: mail-base dovecot rainloop owncloud run-dovecot run-rainloop run-owncloud

mail-base: 
	cd mail-base; docker build -t mail-base .

dovecot: mail-base
	cd dovecot; docker build -t dovecot:2.1.7 .

cyrus: mail-base
	cd cyrus; docker build -t cyrus:2.4.17 .

courier: mail-base
	cd courier; docker build -t courier:0.73.1 .

rainloop: dovecot
	cd rainloop; docker build -t rainloop:1.6.9 .

mailpile: dovecot
	cd mailpile; docker build -t mailpile:latest .

owncloud: dovecot
	cd owncloud; docker build -t owncloud:8.0.2 .

run-dovecot:
	docker run -e FIXMYMAILPW=fixmymail -e CYRUSPW=cyrus -d -p 0.0.0.0:1025:25 -p 0.0.0.0:10587:587 -p 0.0.0.0:10143:143 -v /srv/vmail:/srv/vmail dovecot:2.1.7

run-courier:
	docker run -e FIXMYMAILPW=fixmymail -e CYRUSPW=cyrus -d -p 0.0.0.0:1125:25 -p 0.0.0.0:11587:587 -p 0.0.0.0:11143:143 -v /srv/vmail:/srv/vmail courier:0.73.1

run-cyrus:
	docker run -e FIXMYMAILPW=fixmymail -e CYRUSPW=cyrus -d -p 0.0.0.0:1225:25 -p 0.0.0.0:12587:587 -p 0.0.0.0:12143:143 -v /srv/vmail:/srv/vmail cyrus:2.4.17

run-rainloop:
	docker run -d -p 127.0.0.1:33100:80 rainloop:1.6.9

run-mailpile:
	docker run -d -p 127.0.0.1:33411:33411 mailpile:latest

run-owncloud:
	docker run -d -p 127.0.0.1:33200:80 -v /srv/owncloud:/var/www/owncloud/data owncloud:8.0.2 

run-all: run-dovecot run-rainloop run-owncloud
