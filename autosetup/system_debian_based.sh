#!/bin/bash
# Auto Setup Script for debian-based Linux Distributions

# add Repositories
sudo add-apt-repository ppa:danielrichter2007/grub-customizer -y
sudo add-apt-repository ppa:ubuntu-lxc/lxd-stable -y
sudo add-apt-repository ppa:webupd8team/java -y
sudo add-apt-repository ppa:nilarimogard/webupd8 -y
sudo add-apt-repository ppa:nextcloud-devs/client -y
sudo add-apt-repository ppa:mozillateam/firefox-next -y

sudo apt update

sudo apt install git cmake oracle-java8-installer oracle-java8-set-default -y

# install tools
sudo apt install keepassx -y
sudo apt install vlc grub-customizer texlive-full texmaker evolution evolution-ews libreoffice yakuake nextcloud-client-nautilus -y

if [[ `uname -a` == *"Ubuntu"* ]]; then
  sudo add-apt-repository ppa:snwh/pulp -y
  sudo apt update
  sudo apt install -y unity-tweak-tool paper-gtk-theme paper-icon-theme
fi

# set up development environment
    #golang Setup
    mkdir $HOME/go
    export GOPATH=$HOMEgo
    mkdir $GOPATH/bin
    mkdir $GOPATH/src
    mkdir $GOPATH/lib

    cp /etc/skel/.profile $HOME/.profile
    echo 'export GOPATH=$HOME/go' >> $HOME/.profile
    echo 'export PATH=$PATH:$GOPATH/bin' >> $HOME/.profile

cd /tmp
wget https://binaries.symless.com/v2.0.1/synergy_2.0.1.stable-b1034%2B59dd93a0_amd64.deb
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
wget https://desktop-download.mendeley.com/download/apt/pool/main/m/mendeleydesktop/mendeleydesktop_1.17.11-stable_amd64.deb
wget https://github.com/downloads/maoserr/redshiftgui/RedshiftGUI-0.2.1-Linux-x86_64.deb
sudo dpkg -i *.deb
rm *.deb

sudo snap install intellij-idea-ultimate --classic
sudo snap install pycharm-professional --classic
sudo snap install atom --classic
sudo snap install ubuntu-make --classic
sudo snap install telegram-latest

ubuntu-make.umake ide eclipse
ubuntu-make.umake ide gogland --eap
ubuntu-make.umake android android-studio

# gdr
chmod +x TU/gdr_aptonly.sh
TU/gdr_aptonly.sh

# upgrade packages
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y
