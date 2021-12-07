#!/bin/bash
VERSION=7583922
DIR=~/sdks/android

mkdir -p "$DIR"
cd /tmp
wget "https://dl.google.com/android/repository/commandlinetools-linux-${VERSION}_latest.zip"
unzip "./commandlinetools-linux-${VERSION}_latest.zip"
./cmdline-tools/bin/sdkmanager --sdk_root="$DIR" "cmdline-tools;latest" "platform-tools"
rm -rf ./cmdline-tools

find "$DIR/cmdline-tools/latest/bin/" -maxdepth 1 -executable -type f -exec ln -s {} ~/bin \;
find "$DIR/platform-tools/" -maxdepth 1 -executable -type f -exec ln -s {} ~/bin \;

echo "export ANDROID_HOME=$DIR" >> ~/.local.env.zsh
