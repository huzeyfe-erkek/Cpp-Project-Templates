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
fn_libmylibrary "libmycudalibrary" $libraryName $dstFullPath

# (12) Open cuda.pri and update libmycudalibrary_BUILD
tmp=$dstFullPath/cuda.pri
sed -i -e "s/${keyString}_BUILD/${libraryName}_BUILD/g" $tmp
sed -i -e "s/${keyString^^}_BUILD_PATH/${libraryName^^}_BUILD_PATH/g" $tmp # Update library build path
