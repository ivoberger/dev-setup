#!/bin/bash
sudo apt-get update
sudo apt-get install -yqq wget curl git unzip zip zsh xz-utils gnupg software-properties-common command-not-found socat apt-transport-https ca-certificates
sudo apt-file update

echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update
sudo apt-get -yqq install -f
sudo apt-get -yqq upgrade
sudo apt-get -yqq install rcm build-essential
sudo chsh --shell=/usr/bin/zsh $USER

rcup -d dotfiles -f
zsh -c "nvm install --lts"
zsh -c "npm i -g npm pnpm yarn"
zsh; exit;
