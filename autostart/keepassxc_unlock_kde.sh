#!/bin/bash
sleep 1s
dbpath=~/Nextcloud/Software/
dbname=MainDB.kdbx
rm $dbpath.$dbname.lock
kwallet-query kdewallet -r KeePass | keepassxc --pw-stdin $dbpath$dbname
