#!/bin/bash
debs=$(find ~/Downloads -type f -name '*.deb')

for deb in "$debs"
do
    sudo apt install "$deb"
    
done
rm -r ~/Downloads/*.deb