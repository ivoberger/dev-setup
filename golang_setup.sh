#!/bin/bash
check_ssh=$1

# check for root user
if [[ "$USER" != "root" ]]; then
  sudo="sudo"
fi
go_latest_stable="go1.7.4"
##### INSTALL GOLANG + OTHER DEPENDENCIES #####
if [[ `hash go 2>/dev/null` ]] || [[ `go version 2>/dev/null` != *"$go_latest_stable"* && `go version 2>/dev/null` != *"devel"* ]]; then
  echo -e "Installing $go_latest_stable"
  arch=`uname -m`
  if [[ ${arch} == "x86_64" ]]; then
    go_url="https://storage.googleapis.com/golang/$go_latest_stable.linux-amd64.tar.gz"
    archive="$go_latest_stable.linux-amd64.tar.gz"
  elif [[ ${arch} == "x86_32" ]]; then
    go_url="https://storage.googleapis.com/golang/$go_latest_stable.linux-386.tar.gz"
    archive="$go_latest_stable.linux-386.tar.gz"
  elif [[ "$arch" == *"arm"* ]]; then
    go_url="https://storage.googleapis.com/golang/$go_latest_stable.linux-armv6l.tar.gz"
    archive="$go_latest_stable.linux-armv6l.tar.gz"
  fi
  cd $HOME
  if [[ ! -e ${archive} ]]; then
    echo "Downloading golang archive"
    wget -q --show-progress ${go_url}
  fi

  echo "Purging old golang installation (if existing)"
  ${sudo} apt-get purge golang -y 1>/dev/null 2>&1
  ${sudo} rm -rf "/usr/local/go"

  echo "Extracting golang archive"
  ${sudo} tar -xzf ${archive} -C /usr/local
  ${sudo} rm ${archive}
  export GOROOT=/usr/local/go
  export PATH=$PATH:/usr/local/go/bin
  export GOROOT=/usr/local/go

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
echo "Installing general dependencies"
${sudo} apt-get update
${sudo} apt-get install git -y
