#! /bin/bash
# Removing unwanted preinstalled software (manjaro)
sudo pacman -Rsn --noconfirm konversation jre8-openjdk jdk8-openjdk kwrite samba cantata steam-manjaro krita inkscape skanlite gwenview kdenetwork-kget k3b kdenlive manjaro-hello manjaro-documentation-en
# Full system upgrade
sudo pacman -Syyu --noconfirm
# System
sudo konsole -e pacman -S --noconfirm --needed linux49 linux49-nvidia linux49-r8168 linux412 linux412-nvidia linux412-r8168 &
# Internet
konsole -e yaourt -S --noconfirm --needed google-chrome telegram-desktop-bin nextcloud-client skypeforlinux-bin &
# Office
konsole -e yaourt -S --noconfirm --needed texmaker texlive-most gimp scribus okular &
# Tools
konsole -e yaourt -S --noconfirm --needed grub-customizer gigolo gnome-disk-utility synergy xnviewmp unzip &
# Miscellaneous
konsole -e yaourt -S --noconfirm --needed redshift bash-completion gpmdp &
# Development
konsole -e yaourt -S --noconfirm --needed jdk go-tools python2-pip python-pip android-sdk &
konsole -e yaourt -S --noconfirm --needed intellij-idea-ultimate-edition pycharm-professional gogland android-studio atom

sudo chmod a+rw /opt/android-sdk
konsole -e bash keepassXhttp.sh
yaourt -Qdt
