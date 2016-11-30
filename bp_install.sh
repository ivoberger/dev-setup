#!/bin/bash
check_ssh=$1

# check for root user
if [[ "$USER" != "root" ]]; then
 sudo="sudo"
fi
##### INSTALL GOLANG + OTHER DEPENDENCIES #####
if [[ `hash go 2>/dev/null` ]] || [[ `go version 2>/dev/null` != *"go1.7"* && `go version 2>/dev/null` != *"devel"* ]]; then
 echo -e "Installing GO 1.7.3"
 arch=`uname -m`
 if [[ ${arch} == "x86_64" ]]; then
   go_url="https://storage.googleapis.com/golang/go1.7.3.linux-amd64.tar.gz"
   archive="go1.7.3.linux-amd64.tar.gz"
 elif [[ ${arch} == "x86_32" ]]; then
   go_url="https://storage.googleapis.com/golang/go1.7.3.linux-386.tar.gz"
   archive="go1.7.3.linux-386.tar.gz"
 elif [[ "$arch" == *"arm"* ]]; then
   go_url="https://storage.googleapis.com/golang/go1.7.3.linux-armv6l.tar.gz"
   archive="go1.7.3.linux-armv6l.tar.gz"
 fi
 cd $HOME
 if [[ ! -e ${archive} ]]; then
   echo "Downloading golang archive"
   wget -q --show-progress ${go_url}
 fi

 echo "Extracting golang archive"
 ${sudo} tar -xzf ${archive} -C /usr/local
 ${sudo} rm ${archive}
 export GOROOT=/usr/local/go
 export PATH=$PATH:/usr/local/go/bin
 export GOROOT=/usr/local/go

 if [[ `hash git 2>/dev/null` ]]; then
   echo "Installing dependencies"
   ${sudo} apt-get update
   ${sudo} apt-get install git -y
 fi

 ##### GO WORKSPACE SETUP #####
 # create go home directory, set GOPATH and add go binaries to PATH
 echo "Setting up GOPATH"
 mkdir $HOME/go
 export GOPATH=$HOME/go
 export PATH=$PATH:${GOPATH}/bin
 # add needed environment variables to autostart
 # cp /etc/skel/.profile $HOME/.profile
 echo 'export GOROOT=/usr/local/go' >> $HOME/.profile
 echo 'export PATH=$PATH:$GOROOT/bin' >> $HOME/.profile
 echo 'export GOPATH=$HOME/go' >> $HOME/.profile
 echo 'export PATH=$PATH:$GOPATH/bin' >> $HOME/.profile
else
 ## GOLANG installation found
 echo -e "Found GO"
fi

# install golint
echo "Installing golint"
go get -u github.com/golang/lint/golint

##### REPOSITORY SETUP #####

# check if SSH key is present
while [[ "$check_ssh" != "y" && "$check_ssh" != "n" && "$check_ssh" != "ci" ]]; do
 read -p "Clone repository using SSH ? (y [SSH Key required]/n [for HTTPS]): " check_ssh
done

# get SIT GitLab username
git_username="roland.rieke"
# create directories
path_repo="$GOPATH/src/git.sit.fraunhofer.de/$git_username"
mkdir -p ${path_repo}
cd ${path_repo}
path_repo="$path_repo/Praktikum-Automotive-Security-Monitor"

if [[ "$check_ssh" == "y" || "$check_ssh" == "n" ]]; then
 # set url to repo according to user choice
 if [[ "$check_ssh" == "y" ]]; then
   git_url="git@git.sit.fraunhofer.de:roland.rieke/Praktikum-Automotive-Security-Monitor.git"
 elif [[ "$check_ssh" == "n" ]]; then
   git_url="https://git.sit.fraunhofer.de/roland.rieke/Praktikum-Automotive-Security-Monitor.git"
 fi
 # clone repository
 echo "Cloning repository"
 git clone ${git_url}

 # create symlink for pre-commit hook
 ln -s "$path_repo/scripts/pre-commit.sh" "$path_repo/.git/hooks/pre-commit"
 # Add execution permissions
 chmod +x "$path_repo/scripts/pre-commit.sh"
 chmod +x "$path_repo/.git/hooks/pre-commit"

elif [[ "$check_ssh" == "ci" ]]; then
 echo "CI setup"
 mkdir -p ${path_repo}
 cp -R $CI_PROJECT_DIR/* ${path_repo}/
fi

cd ${path_repo}

##### BUILD AND RUN #####
#go build
#$GOPATH/bin/Praktikum-Automotive-Security-Monitor
