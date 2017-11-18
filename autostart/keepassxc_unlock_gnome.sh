#!/bin/bash
dbpath=~/Nextcloud/Software/MainDB.kdbx
secret-tool lookup passwords MainDB | keepassxc --pw-stdin $dbpath
