#!/bin/bash
# 2023.06.08
# Huzeyfe Erkek, huzeyfe.erkek@outlook.com

echo "Welcome! Last updated: 2023.06.08"
echo
keyString="libmylibrary"

# Get name
read -p 'Please enter library name: ' libraryName
read -p 'Please enter destination directory: ' dstFolder
dstFullPath=$dstFolder/$libraryName

# Copy source folder and contents
cp -a $keyString $dstFullPath

# (1) Open bin/.gitignore and update replace library name
tmp=$dstFullPath/bin/.gitignore
sed -i -e "s/${keyString}/${libraryName}/g" $tmp

# (2) Rename global header file in include directory
mv $dstFullPath/include/${keyString}_global.h $dstFullPath/include/${libraryName}_global.h 

# (3) Open include/libmylibrary_global.h and update header guard, library build definition and export definition.
tmp=$dstFullPath/include/${libraryName}_global.h
sed -i -e "s/${keyString^^}_GLOBAL_H/${libraryName^^}_GLOBAL_H/g" $tmp # Header guard
sed -i -e "s/${keyString}_BUILD/${libraryName}_BUILD/g" $tmp # Library build definition
sed -i -e "s/${keyString^^}_EXPORT/${libraryName^^}_EXPORT/g" $tmp # Export definition

# (4) Open include/include.pri and update library build definition and global header file
sed -i -e "s/${keyString}_BUILD/${libraryName}_BUILD/g" $dstFullPath/include/include.pri
sed -i -e "s/${keyString}_global.h/${libraryName}_global.h/g" $dstFullPath/include/include.pri

# (5) Rename src/${libraryName}.pro
mv $dstFullPath/src/${keyString}.pro $dstFullPath/src/${libraryName}.pro

# (6) Open src/${libraryName}.pro and update ${libraryName}_BUILD
sed -i -e "s/${keyString}_BUILD/${libraryName}_BUILD/g" $dstFullPath/src/${libraryName}.pro

# (7) Rename src/${libraryName}-ALL.pro
mv $dstFullPath/src/${keyString}-ALL.pro $dstFullPath/src/${libraryName}-ALL.pro

# (8) Open src/${libraryName}-All.pro and update *.pro files
sed -i -e "s/${keyString}/${libraryName}/g" $dstFullPath/src/${libraryName}-ALL.pro

# (9) Rename test/${libraryName}-test.pro
mv $dstFullPath/test/${keyString}-test.pro $dstFullPath/test/${libraryName}-test.pro

# (10) Open test/${libraryName}-test.pro and update include(...) commands
sed -i -e "s/${keyString}/${libraryName}/g" $dstFullPath/test/${libraryName}-test.pro

# (11) Rename ${libraryName}.pri
mv $dstFullPath/${keyString}.pri $dstFullPath/${libraryName}.pri

# (12) Open ${libraryName}.pri and update LIB_NAME
sed -i -e "s/${keyString}/${libraryName}/g" $dstFullPath/${libraryName}.pri

# (13) Update README.md
sed -i -e "s/${keyString}/${libraryName}/g" $dstFullPath/README.md
sed -i -e "s/${keyString^^}/${libraryName^^}/g" $dstFullPath/README.md
