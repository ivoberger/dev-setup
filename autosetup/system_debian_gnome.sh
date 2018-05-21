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
sudo add-apt-repository ppa:pbek/qownnotes -y
sudo add-apt-repository ppa:maarten-fonville/android-studio -y
sudo add-apt-repository ppa:git-core/ppa -y

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo sh -c 'deb [arch=amd64] https://repo.skype.com/deb stable main" > /etc/apt/sources/list.d/skype-stable.list'
sudo sh -c 'echo "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1704/x86_64 /" > /etc/apt/sources/list.d/cuda.list'
sudo sh -c 'deb https://desktop-download.mendeley.com/download/apt stable main" > /etc/apt/sources/list.d/mendeleydesktop.list'
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash

cd /tmp
wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1404/x86_64/nvinfer-runtime-trt-repo-ubuntu1404-3.0.4-ga-cuda9.0_1.0-1_amd64.deb
wget https://binaries.symless.com/v2.0.12/ubuntu/synergy_2.0.12.beta~b1677%2B0b61673b_amd64.deb
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
sudo dpkg -i *.deb
rm *.deb

sudo apt update

# upgrade packages
sudo apt remove -y apport thunderbird*
sudo apt upgrade -y
sudo apt dist-upgrade -y

sudo apt install -y git git-lfs cmake oracle-java9-installer oracle-java9-set-default

# install tools
sudo apt install -y vlc grub-customizer texlive-full evolution evolution-ews libreoffice yakuake konsole nextcloud-client-nautilus code
sudo apt install -y gnome-tweak-tool keepassxc libsecret-tools telegram qownnotes htop gimp gparted linphone dconf-editor mendeley skypeforlinux
sudo apt install -y network-manager-openconnect-gnome network-manager-openvpn-gnome network-manager-pptp-gnome network-manager-ssh-gnome network-manager-l2tp-gnome network-manager-iodine-gnome network-manager-vpnc-gnome
sudo apt install -y libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386 android-studio code
sudo apt install -y --allow-downgrades cuda-9-0 libnvinfer-dev libcudnn7-dev=7.0.5.15-1+cuda9.0 libcudnn7=7.0.5.15-1+cuda9.0 cuda-command-line-tools python3-pip python3-dev
sudo apt-mark hold libcudnn7 libcudnn7-dev


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
timedatectl set-local-rtc true

sudo -H pip3 install --upgrade pip wheel setuptools
sudo -H pip3 install numpy scipy matplotlib seaborn scikit-learn pandas scikit-pandas h5py tensorflow-gpu tensorboard keras
sudo -H pip3 install flake8 autopep8 virtualenv
