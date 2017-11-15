#!/bin/bash
updmap
cd "$1"
cp -R texmf/* $HOME/.texmf-var/
sudo texhash
updmap --enable Map 5ch.map
updmap --enable Map 5fp.map
updmap --enable Map 5sf.map
updmap --listmaps | egrep "^Map[[:blank:]]*5"
