#!/bin/bash
sudo apt update
sudo apt install -y wget curl git unzip zip zsh xz-utils libgbm-dev gnupg software-properties-common command-not-found socat
sudo apt-file update

wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
sudo apt install -y ./gitkraken-amd64.deb
rm ./gitkraken-amd64.deb

curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt update
sudo apt -y install -f
sudo apt -y upgrade
sudo apt -y install rcm build-essential
sudo apt -y install google-cloud-sdk
sudo chsh --shell=/usr/bin/zsh ivo

rcup -d dotfiles -f
zsh; exit;
