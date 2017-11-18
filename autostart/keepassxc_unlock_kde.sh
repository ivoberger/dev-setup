#!/bin/bash
dbpath=~/Nextcloud/Software/MainDB.kdbx
kwallet-query kdewallet -r KeePass | keepassxc --pw-stdin $dbpath
