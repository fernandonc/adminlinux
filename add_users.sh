#!/bin/bash
# se necesita para mkpasswd: sudo apt-get install whois

lista="lista"
IFS=','
for i in `cat $lista`
do
  USER="${i}"
  SAL="0123"
  PASS="`cat /dev/random | tr -dc '[:alnum:]._#-' | head -c 8; echo -n`"
  PW="`mkpasswd -m sha-256 $PASS 'SALT'${SAL} `"  
  useradd --password "${PW}" --create-home --home-dir /home/$USER --shell /usr/sbin/nologin --gid users $USER
done