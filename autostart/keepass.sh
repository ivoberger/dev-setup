#!/bin/bash
# startup keepass with a password from KWallet
walletkey=$(kwallet-query kdewallet -r KeePass)
keepassx /run/media/ivo/nextcloud/Software/KeePassPortable/MainDB.kdbx &
sleep 0.5
xdotool type --window KeePassX "$walletkey"
xdotool key --window KeePassX Return
xdotool key --window KeePassX Alt+F4
