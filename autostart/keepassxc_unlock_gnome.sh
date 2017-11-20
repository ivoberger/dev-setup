#!/bin/bash
dbpath=~/Nextcloud/Software/
dbname=MainDB.kdbx
rm $dbpath.$dbname.lock
secret-tool lookup passwords MainDB | keepassxc --pw-stdin $dbpath$dbname
