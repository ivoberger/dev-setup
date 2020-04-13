#!/bin/bash
wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -
sudo add-apt-repository -y https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
sudo add-apt-repository -y ppa:martin-frost/thoughtbot-rcm
sudo apt update
sudo apt -y upgrade
sudo apt -y install rcm zsh curl build-essential adoptopenjdk-14-openj9 command-not-found unzip
sudo apt -y install curl unzip zip libglu1-mesa xz-utils
sudo chsh --shell=/usr/bin/zsh ivo
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
rcup -d dotfiles -f
zsh -c "cd ~; source .zshrc; zimfw install"
