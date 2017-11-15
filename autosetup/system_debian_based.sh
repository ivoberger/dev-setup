#!/bin/bash
# Auto Setup Script for debian-based Linux Distributions

# add Repositories
sudo add-apt-repository ppa:danielrichter2007/grub-customizer -y
sudo add-apt-repository ppa:ubuntu-lxc/lxd-stable -y
sudo add-apt-repository ppa:dlech/keepass2-plugins -y
sudo add-apt-repository ppa:webupd8team/atom -y
sudo add-apt-repository ppa:webupd8team/java -y
sudo add-apt-repository ppa:nilarimogard/webupd8 -y
sudo add-apt-repository ppa:nextcloud-devs/client -y
sudo add-apt-repository ppa:atareao/telegram -y
sudo add-apt-repository ppa:maarten-fonville/android-studio -y
sudo add-apt-repository ppa:mmk2410/intellij-idea -y
sudo add-apt-repository ppa:longsleep/golang-backports -y
sudo add-apt-repository ppa:mozillateam/firefox-next -y

sudo add-apt-repository ppa:viktor-krivak/pycharm -y
sudo sh -c 'echo deb http://ppa.launchpad.net/viktor-krivak/pycharm/ubuntu zesty main > /etc/apt/sources.list.d/viktor-krivak-ubuntu-pycharm-xenial.list'

sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu $(lsb_release -sc)-getdeb apps" > /etc/apt/sources.list.d/getdeb.list'
wget -q -O - http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -

wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'

wget -qO - https://gpmdp.xyz/bintray-public.key.asc | sudo apt-key add -
sudo sh -c 'echo "deb https://dl.bintray.com/marshallofsound/deb debian main" >> /etc/apt/sources.list.d/gpmdp.list'

sudo apt update

sudo apt install git cmake golang atom oracle-java9-installer oracle-java9-set-default -y

# install tools
sudo apt install keepassx -y
sudo apt install grub-customizer texlive-full texmaker thunderbird libreoffice yakuake -y

# set up development environment
sudo apt install android-studio intellij-idea-ultimate pycharm-professional -y
    #golang Setup
    mkdir $HOME/go
    export GOPATH=$HOMEgo
    mkdir $GOPATH/bin
    mkdir $GOPATH/src
    mkdir $GOPATH/lib

    cp /etc/skel/.profile $HOME/.profile
    echo 'export GOPATH=$HOME/go' >> $HOME/.profile
    echo 'export PATH=$PATH:$GOPATH/bin' >> $HOME/.profile

# media
sudo apt install vlc* redshift gimp google-play-music-desktop-player -y

# internet
sudo apt install nextcloud-client google-chrome-stable telegram -y

cd /tmp
wget https://binaries.symless.com/v2.0.1/synergy_2.0.1.stable-b1034%2B59dd93a0_amd64.deb
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
wget https://desktop-download.mendeley.com/download/apt/pool/main/m/mendeleydesktop/mendeleydesktop_1.17.11-stable_amd64.deb
wget https://github.com/downloads/maoserr/redshiftgui/RedshiftGUI-0.2.1-Linux-x86_64.deb
sudo dpkg -i *.deb
rm *.deb

# gdr
chmod +x TU/gdr_aptonly.sh
TU/gdr_aptonly.sh

# upgrade packages
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y
