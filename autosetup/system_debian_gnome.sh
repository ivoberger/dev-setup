#!/bin/bash
# Auto Setup Script for Ubuntu Linux Distributions

# add Repositories
sudo add-apt-repository ppa:danielrichter2007/grub-customizer -y
sudo add-apt-repository ppa:ubuntu-lxc/lxd-stable -y
sudo add-apt-repository ppa:webupd8team/java -y
sudo add-apt-repository ppa:nilarimogard/webupd8 -y
sudo add-apt-repository ppa:nextcloud-devs/client -y
sudo add-apt-repository ppa:mozillateam/firefox-next -y
sudo add-apt-repository ppa:maarten-fonville/android-studio -y
sudo add-apt-repository ppa:snwh/pulp -y
sudo add-apt-repository ppa:phoerious/keepassxc -y
sudo add-apt-repository ppa:atareao/telegram -y
sudo add-apt-repository ppa:webupd8team/atom -y
sudo add-apt-repository ppa:longsleep/golang-backports -y
sudo add-apt-repository ppa:viktor-krivak/pycharm -y
sudo add-apt-repository ppa:ubuntuhandbook1/apps -y

sudo sh -c "echo 'deb http://ppa.launchpad.net/viktor-krivak/pycharm/ubuntu zesty main' > /etc/apt/sources.list.d/viktor-krivak-ubuntu-pycharm-xenial.list"

sudo apt update

# upgrade packages
sudo apt remove -y apport thunderbird*
sudo apt upgrade -y
sudo apt dist-upgrade -y

sudo apt install git cmake oracle-java8-installer oracle-java8-set-default -y

# install tools
sudo apt install -y vlc grub-customizer texlive-full texmaker evolution evolution-ews libreoffice yakuake nextcloud-client-nautilus android-studio pycharm-professional intellij-idea-ultimate atom golang-go unity-tweak-tool
sudo apt install -y paper-gtk-theme paper-icon-theme keepassxc libsecret-tools telegram

# set up development environment
#golang Setup
mkdir $HOME/go
export GOPATH=$HOME/go
mkdir $GOPATH/bin
mkdir $GOPATH/src
mkdir $GOPATH/lib

LINE="# Golang setup"
FILE=$HOME/.bashrc
if ! grep -qxF "$LINE" "$FILE"; then
  echo "Adding GOPATH to $FILE"
  echo "$LINE" >> $FILE
  echo 'export GOPATH=$HOME/go ' >> $FILE
  echo 'export PATH=$PATH:$GOPATH/bin' >> $FILE
fi

cd /tmp
wget https://binaries.symless.com/v2.0.1/synergy_2.0.1.stable-b1034%2B59dd93a0_amd64.deb
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
wget https://desktop-download.mendeley.com/download/apt/pool/main/m/mendeleydesktop/mendeleydesktop_1.17.11-stable_amd64.deb
sudo dpkg -i *.deb
rm *.deb

sudo apt install -f -y
sudo apt autoremove -y
