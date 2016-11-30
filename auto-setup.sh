#!/bin/bash
# Auto Setup Script for Ubuntu-based Linux Distributions

# add Repositories
sudo add-apt-repository ppa:danielrichter2007/grub-customizer -y
sudo add-apt-repository ppa:ubuntu-lxc/lxd-stable -y
sudo add-apt-repository ppa:dlech/keepass2-plugins -y
sudo add-apt-repository ppa:webupd8team/atom -y
sudo add-apt-repository ppa:webupd8team/java -y
sudo add-apt-repository ppa:webupd8team/tor-browser -y
sudo add-apt-repository ppa:nilarimogard/webupd8 -y
sudo add-apt-repository ppa:linrunner/tlp -y

wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt update

# install tools
sudo apt install keepass2 keepass2-plugin-keepasshttp keepass2-plugin-keeagent keepass2-plugin-application-indicator -y
sudo apt install grub-customizer tlp tlp-rdw tp-smapi-dkms acpi-call-dkms texlive-full texmaker thunderbird libreoffice -y
# set up development environment
sudo apt install git cmake golang atom oracle-java8-installer oracle-java8-set-default -y
    #golang Setup
    mkdir $HOME/Documents/go
    export GOPATH=$HOME/Documents/go
    mkdir $GOPATH/bin
    mkdir $GOPATH/src
    mkdir $GOPATH/lib
    mkdir -p $GOPATH/src/github.com/IIIuminator
    mkdir -p $GOPATH/src/gitlab.com/illuminator
    mkdir -p $GOPATH/src/bitbucket.com/illuminatos
    mkdir -p $GOPATH/src/git.sit.fraunhofer.de/iberger

    cp /etc/skel/.profile $HOME/.profile
    echo 'export GOPATH=$HOME/Documents/go' >> $HOME/.profile
    echo 'export PATH=$PATH:$GOPATH/bin' >> $HOME/.profile

# media
sudo apt install vlc* -y

# internet
sudo apt install tor-browser owncloud-client google-chrome-stable -y

# upgrade packages
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y
sudo tlp start
