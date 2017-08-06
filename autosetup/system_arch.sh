#! /bin/bash
# Removing unwanted preinstalled software (manjaro)
sudo pacman -Rsn --noconfirm konversation jre8-openjdk jdk8-openjdk kwrite samba cantata steam-manjaro krita inkscape skanlite gwenview kdenetwork-kget k3b kdenlive manjaro-hello manjaro-documentation-en
# Full system upgrade
sudo pacman -Syyu --noconfirm
# System
sudo pacman -S --noconfirm --needed linux49 linux49-nvidia linux49-r8168 linux412 linux412-nvidia linux412-r8168
# Internet
yaourt -S --noconfirm --needed google-chrome telegram-desktop-bin nextcloud-client skypeforlinux-bin &
# Office
yaourt -S --noconfirm --needed texmaker texlive-most gimp scribus okular &
# Tools
yaourt -S --noconfirm --needed keepass keepass-plugin-keeagent keepass-plugin-http keebuntu grub-customizer gigolo gnome-disk-utility synergy xnviewmp unzip &
# Miscellaneous
yaourt -S --noconfirm --needed redshift bash-completion gpmdp &
# Development
yaourt -S --noconfirm --needed jdk go-tools python2-pip python-pip &
yaourt -S --noconfirm --needed intellij-idea-ultimate-edition pycharm-professional gogland android-studio atom
# Cleanup
yaourt -Qdt

bash keepassXhttp.sh
yaourt -Qdt
