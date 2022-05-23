#!/bin/bash
sudo apt update
sudo apt install -y wget curl git unzip zip zsh xz-utils gnupg software-properties-common command-not-found socat
sudo apt-file update

curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt update
sudo apt -y install -f
sudo apt -y upgrade
sudo apt -y install rcm build-essential
sudo chsh --shell=/usr/bin/zsh $USER

rcup -d dotfiles -f
zsh; exit;
