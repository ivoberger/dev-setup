#!/bin/bash
# Auto Setup Script for Ubuntu-based Linux Distributions

# add Repositories
sudo add-apt-repository ppa:danielrichter2007/grub-customizer -y
sudo add-apt-repository ppa:ubuntu-lxc/lxd-stable -y
sudo add-apt-repository ppa:dlech/keepass2-plugins -y

# install packages
sudo apt update
# tools
sudo apt install keepass2 keepass2-plugin-keepasshttp keepass2-plugin-keeagent keepass2-plugin-application-indicator -y
# development
sudo apt install git cmake golang -y
# media
sudo apt install vlc* -y

# upgrade packages
sudo apt upgrade -y
sudo apt dist-upgrade -y