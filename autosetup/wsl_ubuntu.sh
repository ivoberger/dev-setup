#!/bin/bash
sudo add-apt-repository -y ppa:martin-frost/thoughtbot-rcm
sudo apt update
sudo apt -y upgrade
sudo apt -y install rcm zsh curl
sudo chsh --shell=/usr/bin/zsh ivo
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
rcup -d dotfiles -f
zsh -c "cd ~; source .zshrc; zimfw install"
