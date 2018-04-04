#!/bin/bash
# Auto Setup Script for Ubuntu Linux Distributions

# add Repositories
sudo add-apt-repository ppa:danielrichter2007/grub-customizer -y
sudo add-apt-repository ppa:ubuntu-lxc/lxd-stable -y
sudo add-apt-repository ppa:webupd8team/java -y
sudo add-apt-repository ppa:nilarimogard/webupd8 -y
sudo add-apt-repository ppa:nextcloud-devs/client -y
sudo add-apt-repository ppa:snwh/pulp -y
sudo add-apt-repository ppa:phoerious/keepassxc -y
sudo add-apt-repository ppa:atareao/telegram -y
sudo add-apt-repository ppa:ubuntuhandbook1/apps -y

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

sudo sh -c "echo 'deb http://ppa.launchpad.net/viktor-krivak/pycharm/ubuntu zesty main' > /etc/apt/sources.list.d/viktor-krivak-ubuntu-pycharm-xenial.list"

sudo apt update

# upgrade packages
sudo apt remove -y apport thunderbird*
sudo apt upgrade -y
sudo apt dist-upgrade -y

sudo apt install -y git cmake oracle-java9-installer oracle-java9-set-default

# install tools
sudo apt install -y vlc grub-customizer texlive-full texmaker evolution evolution-ews libreoffice yakuake nextcloud-client-nautilus code
sudo apt install -y intellij-idea-ultimate
sudo apt install -y gnome-tweak-tool keepassxc libsecret-tools telegram
sudo apt install -y network-manager-openconnect-gnome network-manager-openvpn-gnome network-manager-pptp-gnome network-manager-ssh-gnome network-manager-l2tp-gnome network-manager-iodine-gnome network-manager-vpnc-gnome

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
wget https://binaries.symless.com/v2.0.4/synergy_2.0.4.stable~b1205%2Bfcb59be4_amd64.deb
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
wget https://desktop-download.mendeley.com/download/apt/pool/main/m/mendeleydesktop/mendeleydesktop_1.17.11-stable_amd64.deb
sudo dpkg -i *.deb
rm *.deb

sudo apt install -f -y
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
sudo snap install --classic go
sudo snap install --classic android-studio
sudo snap install --classic pycharm-professional
timedatectl set-local-rtc true
