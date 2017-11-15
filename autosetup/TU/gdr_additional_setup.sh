#!/bin/bash
mkdir ~/.ssh
chmod 700 ~/.ssh
touch ~/.ssh/gdr2017_rsa
chmod 400 ~/.ssh/gdr2017_rsa
echo "Host git.sim.informatik.tu-darmstadt.de
  User git
  Hostname git.sim.informatik.tu-darmstadt.de
  PreferredAuthentications publickey
  IdentityFile ~/.ssh/gdr2017_rsa" > ~/.ssh/config

git clone git@git.sim.informatik.tu-darmstadt.de:TurtleBot/turtlebot_install.git ~/turtle
cd ~/turtle
./install.sh
echo ". ~/turtle/setup.bash" >> ~/.bashrc
mkdir ~/Octave
cd ~/Octave
git clone git@git.sim.informatik.tu-darmstadt.de:TurtleBot/jsonlab.git
git clone git@git.sim.informatik.tu-darmstadt.de:TurtleBot/octave_rosbridge.git
echo "addpath('~/Octave/jsonlab');
addpath(genpath('~/Octave/octave_rosbridge'));" > ~/.octaverc
echo "~/Octave/octave_rosbridge/RosBridge.jar" > ~/javaclasspath.txt

echo "Run
turtle install ui simulation manipulator_arm
turtle install tuda_exercises_student
turtle install_gazebo 8
turtle update_make
from a new terminal to complete the installation"
