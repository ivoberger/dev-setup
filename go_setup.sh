# set up development environment
echo "enter user name (according to present ssh key"
read
sudo apt install git golang atom -y
    #golang Setup
    mkdir $HOME/go
    export GOPATH=$HOME/go
    mkdir $GOPATH/bin
    mkdir $GOPATH/src
    mkdir $GOPATH/lib
    mkdir -p $GOPATH/src/git.sit.fraunhofer.de/

    go get -u github.com/golang/lint/golint

    cp /etc/skel/.profile $HOME/.profile
    echo 'export GOPATH=$HOME/go' >> $HOME/.profile
    echo 'export PATH=$PATH:$GOPATH/bin' >> $HOME/.profile
