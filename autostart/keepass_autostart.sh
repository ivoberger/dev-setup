#!/bin/bash
# startup keepass with a password from KWallet
walletkey=$(kwallet-query kdewallet -r KeePass)
dbpath="/run/media/ivo/Data_Main/Nextcloud/Software/KeePassPortable/MainDB.kdbx"
echo "$walletkey" | keepass $dbpath --pw-stdin -minimize
