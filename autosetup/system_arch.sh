#! /bin/bash
sudo pacman -Syyua --noconfirm
# System
sudo pacman -S linux49 linux49-nvidia linux49-r8168 linux412 linux412-nvidia linux412-r8168
# Internet
yaourt -S --noconfirm google-chrome telegram-desktop-bin nextcloud-client skypeforlinux-bin
# Office
yaourt -S --noconfirm texmaker texlive-most gimp scribus okular
# Development
yaourt -S --noconfirm intellij-idea-ultimate-edition pycharm-professional gogland android-studio atom
yaourt -S --noconfirm jdk go-tools gitkraken python2-pip python-pip
# Tools
yaourt -S --noconfirm grub-customizer gigolo gnome-disk-utility synergy 
# Miscellaneous
yaourt -S --noconfirm redshift bash-completion gpmdp net-snmp
# Cleanup
sudo pacman -R konversation jdk8-openjdk jdk8-openjdk-headless xine kwrite openvpn samba smbclient

bash keepassXhttp.sh
yaourt -Qdt

# autostarts
#ln -s ../autostart/keepass_autostart.sh ~/.config/autostart-scripts/keepass_autostart.sh
