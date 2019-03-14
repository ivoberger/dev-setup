#! /bin/bash
# Config
echo fs.inotify.max_user_watches=524288 | sudo tee /etc/sysctl.d/50-max_user_watches.conf
echo kernel.unprivileged_userns_clone=1 | sudo tee /etc/sysctl.d/00-local-userns.conf
echo "auth            optional        pam_gnome_keyring.so" | sudo tee -a /etc/pam.d/sddm
echo "session         optional        pam_gnome_keyring.so auto_start" | sudo tee -a /etc/pam.d/sddm
sudo sysctl --system
# Removing unwanted preinstalled software (manjaro)
sudo pacman -Rsn --noconfirm konversation samba manjaro-hello manjaro-documentation-en falkon
# Full system upgrade
sudo pacman -Syyu --noconfirm
echo "MAKEFLAGS, PKGEXT"
sleep 1s
sudo nano /etc/makepkg.conf
yay --save --removemake --nodiffmenu --noeditmenu --noupgrademenu --cleanafter --topdown --combinedupgrade --sudoloop --timeupdate
yay -S --noconfirm --needed jdk jdk8 go
yay -S --noconfirm --needed java-openjfx-bin
# Internet
yay -S --noconfirm --needed brave-beta telegram-desktop-bin nextcloud-client thunderbird
# Office
yay -S --noconfirm --needed texmaker texlive-most gimp libreoffice-fresh inkscape cups gutenprint
# Tools
yay -S --noconfirm --needed grub-customizer synergy unzip keepassxc gnome-keyring seahorse
# Miscellaneous
yay -S --noconfirm --needed redshift plasma5-applets-redshift-control bash-completion
yay -S --noconfirm --needed skypeforlinux-stable-bin slack-desktop linphone kpgp plasma-browser-integration
# Development
## Android
yay -S --noconfirm --needed android-studio android-studio-canary android-sdk android-sdk-build-tools android-emulator android-google-repository android-platform android-sources
yay -S --noconfirm --needed android-platform-22 android-sources-22
## Web
yay -S --noconfirm --needed nodejs-lts-dubnium yarn
## Flutter/Dart
yay -S --noconfirm --needed dart flutter
sudo chmod a+rw -R /opt/flutter
flutter config --no-analytics
## Misc
yay -S --noconfirm --needed intellij-idea-ultimate-edition goland visual-studio-code-bin gitkraken docker gitlab-runner google-cloud-sdk notable-bin
sudo systemctl enable docker
sudo systemctl start docker
sudo groupadd docker
sudo usermod -aG docker $USER
yay -Qdt 
yay -c --noconfirm
