#!/bin/bash
# Auto Setup Script for Ubuntu Linux Distributions
# Switch to mirrors
sudo sed -i -e 's/http:\/\/...archive/mirror:\/\/mirrors/' -e 's/\/ubuntu\//\/mirrors.txt/' /etc/apt/sources.list
sudo apt update
# add Repositories
sudo add-apt-repository ppa:danielrichter2007/grub-customizer -y -n
sudo add-apt-repository ppa:otto-kesselgulasch/gimp -y -n
sudo add-apt-repository ppa:phoerious/keepassxc -y -n
sudo add-apt-repository ppa:webupd8team/java -y -n
sudo add-apt-repository ppa:nilarimogard/webupd8 -y -n
sudo add-apt-repository ppa:nextcloud-devs/client -y -n
sudo add-apt-repository ppa:pbek/qownnotes -y -n
sudo add-apt-repository ppa:git-core/ppa -y -n

sudo apt install -y curl
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

cd /tmp
wget https://desktop-download.mendeley.com/download/apt/pool/main/m/mendeleydesktop/mendeleydesktop_1.19.1-stable_amd64.deb
wget https://binaries.symless.com/synergy/v1-core-standard/v1.10.0-stable-275cdc1c/synergy_1.10.0.stable_b36%2B275cdc1c_debian_amd64.deb
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
wget https://repo.skype.com/latest/skypeforlinux-64.deb
sudo dpkg -i *.deb
rm *.deb

sudo apt update
sudo apt install -f -y

# upgrade packages
sudo apt remove -y apport
sudo apt upgrade -y
sudo apt dist-upgrade -y

sudo apt install -y git cmake cifs-tools

# install tools
sudo apt install -y vlc
sudo apt install -y grub-customizer
sudo apt install -y texlive-full
sudo apt install -y libreoffice
sudo apt install -y yakuake
sudo apt install -y nextcloud-client-dolphin
sudo apt install -y thunderbird
# Folder Setup
mkdir -p ~/Development
rm -rf ~/Pictures
rm -rf ~/Music
rm -rf ~/Videos
rm -rf ~/Documents
sudo mkdir -p /media/ivo/Data/Nextcloud
sudo chown ivo:ivo /media/ivo/Data -R
sudo bash -c ' echo "//192.168.178.24/Nextcloud /media/ivo/Data/Nextcloud cifs nofail,credentials=/home/ivo/.smbcredentials,uid=ivo,gid=ivo 0 2" >> /etc/fstab'
ln -s /media/$USER/Data/Nextcloud ~/Nextcloud
ln -s /media/$USER/Data/Nextcloud/Photos ~/Pictures
ln -s /media/$USER/Data/Nextcloud/Videos ~/Videos
ln -s /media/$USER/Data/Nextcloud/Music ~/Music
ln -s /media/$USER/Data/Nextcloud/Documents ~/Documents
ln -s /media/$USER/Data/Nextcloud/Documents/Studium ~/Studies

sudo apt install -y code
sudo apt install -y redshift
sudo apt install -y keepassxc
secret-tool store --label='MainDB' passwords MainDB
sudo apt install -y qownnotes htop gimp
sudo apt install -y linphone telegram-desktop
sudo apt install -y nvidia-390 nvidia-cuda-toolkit libcupti-dev gcc-6 python3-numpy python3-dev python3-pip python3-wheel


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

sudo apt install -f -y
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
sudo snap install --classic go
sudo snap install --classic slack
sudo snap install --classic android-studio

sudo timedatectl set-local-rtc true

sudo -H pip3 install --upgrade pip wheel setuptools
sudo -H pip3 install --upgrade numpy scipy matplotlib seaborn scikit-learn pandas h5py keras joblib
sudo -H pip3 install --upgrade flake8 autopep8 virtualenv pep8
