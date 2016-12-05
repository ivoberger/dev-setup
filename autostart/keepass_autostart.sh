#!/bin/bash
# startup keepass with a password from KWallet
walletkey=$(kwallet-query kdewallet -r KeePass)
dbpath="/media/ivo/Data_Main/Nextcloud/Software/KeePassPortable/MainDB.kdbx"
echo "$walletkey" | keepass2 $dbpath --pw-stdin -minimize
