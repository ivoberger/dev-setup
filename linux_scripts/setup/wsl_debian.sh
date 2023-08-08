#!/bin/bash
sudo apt-get update
sudo apt-get install -yqq wget curl git unzip zip zsh xz-utils gnupg software-properties-common command-not-found socat apt-transport-https ca-certificates
sudo apt-file update

sudo apt-get update
sudo apt-get -yqq install -f
yes | sudo DEBIAN_FRONTEND=noninteractive apt-get -yqq upgrade
sudo apt-get -yqq install rcm build-essential
sudo chsh --shell=/usr/bin/zsh $USER

rcup -d dotfiles -f
zsh -c "fnm install --lts"
zsh -c "corepack enable"
zsh; exit;
