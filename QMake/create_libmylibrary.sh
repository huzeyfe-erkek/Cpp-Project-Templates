#!/bin/bash
# 2023.07.22
# Huzeyfe Erkek, huzeyfe.erkek@outlook.com

echo "Welcome! Last updated: 2024.07.07"
echo

# Get name
read -p 'Please enter library name: ' libraryName
read -p 'Please enter destination directory: ' dstFolder	

# Call the function
source ./func_libmylibrary.sh
dstFullPath=$dstFolder/$libraryName
fn_libmylibrary "libmylibrary" $libraryName $dstFullPath
