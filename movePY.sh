#!/bin/bash

source="/home/pleasework/Downloads"
dest="$1"

py_files=$(find "$source" -maxdepth 1 -type f -name "*.py")

for py_file in $py_files
do 
    mv "$py_file" "$dest$(basename "$py_file")"
    echo "Move $(basename "$py_file") to $dest"
done

