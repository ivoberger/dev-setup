#!/bin/bash
# Auto Setup Script for Ubuntu Linux Distributions
# Switch to mirrors
sudo sed -i -e 's/http:\/\/*.archive/mirror:\/\/mirrors/' -e 's/\/ubuntu\//\/mirrors.txt/' /etc/apt/sources.list
sudo apt update
# add Repositories
sudo add-apt-repository ppa:danielrichter2007/grub-customizer -y -n
sudo add-apt-repository ppa:webupd8team/java -y -n
sudo add-apt-repository ppa:nilarimogard/webupd8 -y -n
sudo add-apt-repository ppa:nextcloud-devs/client -y -n
sudo add-apt-repository ppa:phoerious/keepassxc -y -n
sudo add-apt-repository ppa:pbek/qownnotes -y -n
sudo add-apt-repository ppa:git-core/ppa -y -n

sudo apt install -y curl
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1704/x86_64/7fa2af80.pub

cd /tmp
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1704/x86_64/cuda-repo-ubuntu1704_9.0.176-1_amd64.deb
wget https://desktop-download.mendeley.com/download/apt/pool/main/m/mendeleydesktop/mendeleydesktop_1.18-stable_amd64.deb
wget https://binaries.symless.com/v2.0.12/ubuntu/synergy_2.0.12.beta~b1677%2B0b61673b_amd64.deb
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
sudo dpkg -i *.deb
rm *.deb

sudo apt update
sudo apt install -f -y

# upgrade packages
sudo apt remove -y apport
sudo apt upgrade -y
sudo apt dist-upgrade -y

sudo apt install -y git git-lfs cmake

# install tools
sudo apt install -y vlc
sudo apt install -y grub-customizer
sudo apt install -y texlive-full
sudo apt install -y evolution evolution-ews
sudo apt install -y libreoffice
sudo apt install -y yakuake konsole
sudo apt install -y nextcloud-client-nautilus
# Folder Setup
mkdir -p ~/Development
rm -rf ~/Pictures
rm -rf ~/Music
rm -rf ~/Videos
rm -rf ~/Documents
ln -s /media/$USER/Data/Nextcloud ~/Nextcloud
ln -s /media/$USER/Data/Nextcloud/Photos ~/Pictures
ln -s /media/$USER/Data/Nextcloud/Videos ~/Videos
ln -s /media/$USER/Data/Nextcloud/Music ~/Music
ln -s /media/$USER/Data/Nextcloud/Documents ~/Documents
ln -s /media/$USER/Data/Nextcloud/Documents/Studium ~/Studies

sudo apt install -y code
sudo apt install -y gnome-tweak-tool
sudo apt install -y keepassxc libsecret-tools
secret-tool store --label='MainDB' passwords MainDB
sudo apt install -y qownnotes htop gimp
sudo apt install -y gparted
sudo apt install -y linphone
sudo apt install -y dconf-editor
sudo apt install -y mendeley
sudo apt install -y network-manager-openconnect-gnome network-manager-openvpn-gnome network-manager-pptp-gnome network-manager-ssh-gnome network-manager-l2tp-gnome network-manager-iodine-gnome network-manager-vpnc-gnome chrome-gnome-shell
sudo apt install -y cuda-9-0
sudo apt install -y python3-pip python3-dev


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
sudo snap install telegram-desktop
sudo snap install --classic skype

timedatectl set-local-rtc true

sudo -H pip3 install --upgrade pip wheel setuptools
sudo -H pip3 install numpy scipy matplotlib seaborn scikit-learn pandas h5py tensorflow-gpu tensorboard keras
sudo -H pip3 install flake8 autopep8 virtualenv