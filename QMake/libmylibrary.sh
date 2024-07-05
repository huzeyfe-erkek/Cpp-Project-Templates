#!/bin/bash
# 2024.07.05
# Huzeyfe Erkek, huzeyfe.erkek@outlook.com

echo "Welcome! Last updated: 2024.05.08"
echo
keyString="libmylibrary"

# Get name
read -p 'Please enter library name: ' libraryName
read -p 'Please enter destination directory: ' dstFolder
dstFullPath=$dstFolder/$libraryName

# Copy source folder and contents
cp -a $keyString $dstFullPath

# (1) Rename global header file in include directory
mv $dstFullPath/include/${keyString}_global.h $dstFullPath/include/${libraryName}_global.h 

# (2) Open include/libmylibrary_global.h and update header guard, library build definition and export definition.
tmp=$dstFullPath/include/${libraryName}_global.h
sed -i -e "s/${keyString^^}_GLOBAL_H/${libraryName^^}_GLOBAL_H/g" $tmp # Header guard
sed -i -e "s/${keyString}_BUILD/${libraryName}_BUILD/g" $tmp # Library build definition
sed -i -e "s/${keyString^^}_EXPORT/${libraryName^^}_EXPORT/g" $tmp # Export definition

# (3) Rename ${libraryName}.pro
mv $dstFullPath/${keyString}.pro $dstFullPath/${libraryName}.pro

# (4) Open ${libraryName}.pro, update ${libraryName}_BUILD and ${libraryName}.pri
tmp=$dstFullPath/${libraryName}.pro
sed -i -e "s/${keyString}_BUILD/${libraryName}_BUILD/g" $tmp # Library build definition
sed -i -e "s/${keyString}.pri/${libraryName}.pri/g" $tmp # Library pri

# (5) Rename ${libraryName}-ALL.pro
mv $dstFullPath/${keyString}-ALL.pro $dstFullPath/${libraryName}-ALL.pro

# (6) Open ${libraryName}-All.pro and update *.pro files
sed -i -e "s/${keyString}/${libraryName}/g" $dstFullPath/${libraryName}-ALL.pro

# (7) Rename test/${libraryName}-test.pro
mv $dstFullPath/test/${keyString}-test.pro $dstFullPath/test/${libraryName}-test.pro

# (8) Open test/${libraryName}-test.pro and update include(...) commands
sed -i -e "s/${keyString}/${libraryName}/g" $dstFullPath/test/${libraryName}-test.pro

# (9) Rename ${libraryName}.pri
mv $dstFullPath/${keyString}.pri $dstFullPath/${libraryName}.pri

# (10) Open ${libraryName}.pri and update LIB_NAME
sed -i -e "s/${keyString}/${libraryName}/g" $dstFullPath/${libraryName}.pri

# (13) Update README.md
sed -i -e "s/${keyString}/${libraryName}/g" $dstFullPath/README.md
sed -i -e "s/${keyString^^}/${libraryName^^}/g" $dstFullPath/README.md
