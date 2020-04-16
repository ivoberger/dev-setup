#!/bin/bash

wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
sudo dpkg -i ./gitkraken-amd64.deb

curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo add-apt-repository -y https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
sudo add-apt-repository -y ppa:martin-frost/thoughtbot-rcm
sudo apt update
sudo apt -y install -f
sudo apt -y upgrade
sudo apt -y install rcm zsh curl build-essential adoptopenjdk-14-openj9 command-not-found chromium-browser
sudo apt -y install curl unzip zip libglu1-mesa xz-utils google-cloud-sdk libxss1 libasound2
sudo chsh --shell=/usr/bin/zsh ivo
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
rcup -d dotfiles -f
zsh -c "cd ~; source .zshrc; zimfw install"
