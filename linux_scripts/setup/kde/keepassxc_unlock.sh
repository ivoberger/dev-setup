#!/bin/bash
cat > ~/.config/autostart/keepassxc_unlock_kde.sh.desktop <<- EOM
[Desktop Entry]
Exec=/home/ivo/Dev/Personal/dev-setup/linux_scripts/autostart/keepassxc_unlock_kde.sh
Icon=dialog-scripts
Name=keepassxc_unlock_kde.sh
Path=
Type=Application
X-KDE-AutostartScript=true
EOM
