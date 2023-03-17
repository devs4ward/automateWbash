#!/bin/bash
debs=$(find ~/Downloads -type f -name '*.deb')

for deb in "$debs"
do
    sudo apt install "$deb" -y
    
done
rm -r ~/Downloads/*.deb
