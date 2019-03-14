#! /bin/bash
# Removing unwanted preinstalled software (manjaro)
sudo pacman -Rsn --noconfirm konversation jre8-openjdk jdk8-openjdk kwrite samba cantata steam-manjaro krita inkscape skanlite gwenview kdenetwork-kget k3b kdenlive manjaro-hello manjaro-documentation-en
# Full system upgrade
sudo pacman -Syyu --noconfirm
# Internet
yay -S --noconfirm --needed brave-beta telegram-desktop-bin nextcloud-client
# Office
yay -S --noconfirm --needed texmaker texlive-most gimp libreoffice-fresh
# Tools
yay -S --noconfirm --needed grub-customizer synergy unzip keepassxc
# Miscellaneous
yay -S --noconfirm --needed redshift plasma5-applets-redshift-control bash-completion gpmdp
# Development
yay -S --noconfirm --needed jdk java-openjfx-bin jdk8 java-openjfx
yay -S --noconfirm --needed intellij-idea-ultimate-edition gogland android-studio android-studio-canary visual-studio-code-bin android-sdk android-sdk-build-tools android-emulator android-google-repository android-platform android-platform-22 android-sources android-sources-22
yay -Qdt
