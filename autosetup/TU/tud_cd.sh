#!/bin/bash
updmap
cd "$1"
cp -R texmf/* $HOME/.texlive2017/texmf-var/
sudo texhash
updmap -user --enable Map 5ch.map
updmap -user --enable Map 5fp.map
updmap -user --enable Map 5sf.map
updmap -user --listmaps | egrep "^Map[[:blank:]]*5"
