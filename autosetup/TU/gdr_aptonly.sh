#!/bin/bash
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

sudo add-apt-repository ppa:levi-armstrong/qt-libraries-xenial -y
sudo add-apt-repository ppa:levi-armstrong/ppa -y
sudo apt update

sudo apt install -y ros-kinetic-desktop qt59creator qt57creator-plugin-ros

sudo apt install -y octave octave-doc gnuplot
sudo apt install -y git cmake
