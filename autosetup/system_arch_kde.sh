#! /bin/bash
# Removing unwanted preinstalled software (manjaro)
sudo pacman -Rsn --noconfirm konversation jre8-openjdk jdk8-openjdk kwrite samba cantata steam-manjaro krita inkscape skanlite gwenview kdenetwork-kget k3b kdenlive manjaro-hello manjaro-documentation-en
# Full system upgrade
sudo pacman -Syu --noconfirm
# System
sudo pacman -S --noconfirm --needed linux49 linux49-nvidia linux49-r8168 linux414 linux414-nvidia linux414-r8168
# Internet
yaourt -S --noconfirm --needed google-chrome telegram-desktop-bin nextcloud-client
# Office
yaourt -S --noconfirm --needed texmaker texlive-most gimp
# Tools
yaourt -S --noconfirm --needed grub-customizer gigolo gnome-disk-utility synergy2 unzip keepassxc
# Miscellaneous
yaourt -S --noconfirm --needed redshift plasma5-applets-redshift-control bash-completion gpmdp
# Development
yaourt -S --noconfirm --needed jdk go-tools python2-pip python-pip
yaourt -S --noconfirm --needed intellij-idea-ultimate-edition pycharm-professional gogland android-studio atom
yaourt -Qdt
